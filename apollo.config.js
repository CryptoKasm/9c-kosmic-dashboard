// apollo.config.js
module.exports = {
  client: {
    service: {
      name: "kosmic-dashboard",
      // URL to the GraphQL API
      localSchemaFile: "./schema.graphql",
    },
    // Header options
    //   headers: {
    //     authorization: ''
    //   },
    // Files processed by the extension
    includes: ["src/**/*.vue", "src/**/*.js"],
  },
};
