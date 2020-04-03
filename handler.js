//We'll need the GraphQL server later on

const { GraphQLServerLambda } = require("graphql-yoga");
var fs = require("fs")

const typeDefs = fs.readFileSync("./schema.gql").toString('utf-8');

const resolvers = {
    Query: {
        mysql_getUser: require("./resolver/Query/mysql_getUser").func,
        postgresql_getUser: require("./resolver/Query/postgresql_getUser").func,
    },
    Mutation: {
        mysql_createUser: require("./resolver/Mutation/mysql_createUser").func,
        postgresql_createUser: require("./resolver/Mutation/postgresql_createUser").func,
    }
};