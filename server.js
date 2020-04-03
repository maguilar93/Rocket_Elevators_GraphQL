var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');
const joinMonster = require('join-monster')
const graphql = require('graphql')

// Construct a schema, using GraphQL schema language
// var schema = buildSchema(`
//   type Query {
//     hello: String
//   }
// `);

// The root provides a resolver function for each API endpoint
var root = {
    hello: () => {
        return 'Hello world!';
    },
};


var app = express();
app.use('/graphql', graphqlHTTP({
    // schema: schema,
    rootValue: root,
    graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at http://localhost:4000/graphql');


const { Client } = require('pg')
const client = new Client({
    host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com",
    user: "codeboxx",
    password: "Codeboxx1!",
    database: "mariaaguilar"
})
client.connect()


const Intervention = new graphql.GraphQLObjectType({
    name: 'Intervention',
    fields: () => ({
        building_address: {
            type: Intervention,
            sqlJoin: (buildings, fact_intervention, args) => `${buildings}.address= ${fact_intervention}.id`
        },
        date_start_intervention: { type: graphql.GraphQLString },
        date_end_intervention: { type: graphql.GraphQLString },
    })
});

Intervention._typeConfig = {
    sqlTable: 'intervention',
    uniqueKey: 'id',
}



const QueryRoot = new graphql.GraphQLObjectType({
    name: 'Query',
    fields: () => ({
        hello: {
            type: graphql.GraphQLString,
            resolve: () => "Hello world!"
        },
        interventions: {
            type: new graphql.GraphQLList(Intervention),
            resolve: (parent, args, context, resolveInfo) => {
                return joinMonster.default(resolveInfo, {}, sql => {
                    return client.query(sql)
                })
            }
        },
        intervention: {
            type: Intervention,
            args: { id: { type: graphql.GraphQLNonNull(graphql.GraphQLInt) } },
            where: (fact_intervention, args, context) => `${fact_intervention}.id = ${args.id}`,
            resolve: (parent, args, context, resolveInfo) => {
                return joinMonster.default(resolveInfo, {}, sql => {
                    return client.query(sql)
                })
            }
        },
    })
})

const MutationRoot = new graphql.GraphQLObjectType({
    name: 'Mutation',
    fields: () => ({
        intervention: {
            type: Intervention,
            args: {
                building_address: { type: graphql.GraphQLNonNull(graphql.GraphQLString) },
                date_start_intervention: { type: graphql.GraphQLNonNull(graphql.GraphQLString) },
                date_end_intervention: { type: graphql.GraphQLNonNull(graphql.GraphQLInt) },
            },
            resolve: async (parent, args, context, resolveInfo) => {
                try {
                    return (await client.query("INSERT INTO intervention (building_address, date_start_intervention, date_end_intervention) VALUES ($1, $2, $3) RETURNING *", [args.building_address, args.date_start_intervention, args.date_end_intervention])).rows[0]
                } catch (err) {
                    throw new Error("Failed to insert new intervention")
                }
            }
        }
    })
})

const schema = new graphql.GraphQLSchema({
    query: QueryRoot,
    mutation: MutationRoot
});