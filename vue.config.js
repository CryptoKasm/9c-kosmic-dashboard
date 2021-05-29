module.exports = {
  // publicPath:
  //   process.env.NODE_ENV === "production" ? "/9c-kosmic-dashboard/" : "/",
  chainWebpack: (config) => {
    config.module
      .rule("graphql")
      .test(/\.(graphql|gql)$/)
      .use("graphql-tag/loader")
      .loader("graphql-tag/loader")
      .end();
  },
};
