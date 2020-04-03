class InterventionsController < InheritedResources::Base

  private

    def intervention_params
      params.require(:intervention).permit()
    end

end
