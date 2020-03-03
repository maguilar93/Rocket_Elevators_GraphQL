/*
    form-request calculation and javascript/jquery file.
*/ 

//sets the page to a presentable state on load
jQuery(document).ready(function() {
    for(var i=0; i<=24; i++) {
        var select = document.getElementById("actHours");
        var option = document.createElement("OPTION");
        select.options.add(option);
        option.text = i;
        option.value = i; 
    }
    $("input[type='number']").each(function(){
        $(this).css({"border-color":"rgb(238,238,238)"});
    });
    $("#error-msg").attr('style', "color:#FF0000;");
    ResetForm();
    $(".r-form").hide();
});

//building type dropdown menu selection function
buildingSelect.onchange = function(){
    $(".r-form").hide();
    $(".r-form-elev").show();
    if (buildingSelect.value === "Residential") {
        $(".r-form-res").show();
    } else if (buildingSelect.value === "Commercial") {
        $(".r-form-com").show();
    } else if (buildingSelect.value === "Corporate") {
        $(".r-form-cor").show();
    } else if (buildingSelect.value === "Hybrid") {
        $(".r-form-hyb").show();
    } else {
        $(".r-form-elev").hide();
    }
    ResetForm();
};

//production line button check, returns value of radio button
var RadioCheck = function(){
    if (document.querySelector('input[name="radio-btn"]:checked') === null) {
        return "";
    }
    if (document.querySelector('input[name="radio-btn"]:checked').value === "std"){
        $("#calc-elev-price").text("$ 7565");
        return "std";
    } else if (document.querySelector('input[name="radio-btn"]:checked').value === "prem"){
        $("#calc-elev-price").text("$12,345");
        return "prem";
    } else if (document.querySelector('input[name="radio-btn"]:checked').value === "exc"){
        $("#calc-elev-price").text("$15,400");
        return "exc";
    }
};

//resets the form and outputs (without reset button)
var ResetForm = function(){
    $(".r-form input").each(function(){
        if (this.type === "radio") {
            this.checked = false;
        } else {
            $(this).val("");
            $(this).css({"border-color":"rgb(238,238,238)"});
        }
    });
    $("#calc-tax").text("$ --");
    $("#calc-subtotal").text("$ --");
    $("#calc-total").text("$ --");
    $("#calc-elev").text("--");
    $("#calc-elev-price").text("$ --");
};

//validates inputs to be >=0
$("input[class='used-in-calc']").on("input",function(){
    $(this).css({"border-color":"rgb(238,238,238)"});
    if (this.validity.rangeUnderflow) {
        $(this).css({"border-color":"#FF0000"});
    }


    var counterror = 0;
    $("input[type='number']").each(function(){
        if (this.validity.rangeUnderflow) {
            counterror++;
        }
    });
    if (counterror > 0) {
        $("#error-msg").text("  ⚠️ Invalid Value");
    } else {
        $("#error-msg").text("");
    }
});

function ShowElevs(x) {
    $("#calc-elev").text(x);
};

function ShowElevPrice(pline) {
    if (pline === "std"){
        $("#calc-elev-price").text("$ 7565");
    } else if (pline === "prem"){
        $("#calc-elev-price").text("$12,345");
    } else if (pline === "exc"){
        $("#calc-elev-price").text("$15,400");
    }
};

function ShowTotals(s,f,t) {
    $("#calc-tax").text("$ " + s.toFixed(2));
    $("#calc-subtotal").text("$ " + f.toFixed(2));
    $("#calc-total").text("$ " + t.toFixed(2));
};

//turns data to send into json
function asJSON(test){
    let data = {
        type: test,
        nApts: $("#cNumApt").val() || 0,
        nFlrs: $("#cNumFlr").val() || 0,
        nBsmts: $("#cNumBsmt").val() || 0,
        nOccs: $("#cNumOcc").val() || 0,
        nElevs:$("#cNumElev").val() || 0,
        pLine: RadioCheck()
    };
    return JSON.stringify(data);
};

//post data to nodejs and gets calc response back
function PostCalc(data){
    $.ajax({
        type: "POST",
        url: "https://stormy-lowlands-53016.herokuapp.com/quoteform",
        contentType: "application/json",
        data: data,
        dataType: "json",
        success: function(res, status){
            if (status != "success") {
                console.log("Error loading response");
                return;
            }
            ShowElevs(res.elevs);
            if (res.total !== "") {
                ShowTotals(res.subtotal, res.fee, res.total);
            }
        },
        error: function(result, status, err) {
            console.log("Error loading data");
            return;
        }
    });
};

//event listener for every inputs, for real time calculation update
$("input").on("input",function() {
    if (buildingSelect.value !== "") {
        if (buildingSelect.value === "Residential") {
            if ($("#cNumApt").val() > 0 && $("#cNumFlr").val() > 0){
                PostCalc(asJSON(1));
            }
        } else if (buildingSelect.value === "Commercial") {
            if ($("#cNumElev").val() > 0) {
                PostCalc(asJSON(2));
            }
        } else if (buildingSelect.value === "Corporate" || buildingSelect.value === "Hybrid") {
            if($("#cNumOcc").val() > 0 && $("#cNumFlr").val() > 0 && $("#cNumBsmt").val() >= 0) {
                PostCalc(asJSON(3));
            }
        }
        if (document.querySelector('input[name="radio-btn"]:checked') !== null) {
            ShowElevPrice(document.querySelector('input[name="radio-btn"]:checked').value);
        }
    }   
});