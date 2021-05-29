import { createApp, provide, h } from "vue";
import App from "./App.vue";
import router from "./router";
import { ApolloClient, InMemoryCache } from "@apollo/client";
// import { ApolloClient, createHttpLink, InMemoryCache } from "@apollo/client";
import { DefaultApolloClient } from "@vue/apollo-composable";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

// Add Font-Awesome-Icon library
library.add(fas);

// Create the default Apollo Client
const defaultClient = new ApolloClient({
  uri: "http://localhost:23075/graphql/",
  // https://9c-main-full-state.planetarium.dev/ui/playground
  cache: new InMemoryCache(),
});

// const query = gql`
//   query {
//     goldBalance(address: "0xf5eB9FCbe5D2A658A87b517511f14698ADd28Efa")
//   }
// `;

// defaultClient
//   .query({
//     query,
//   })
//   .then((res) => console.log(res));

// Create App (main)
createApp({
  setup() {
    provide(DefaultApolloClient, defaultClient);
  },
  render() {
    return h(App);
  },
})
  .use(router)
  .component("fa", FontAwesomeIcon)
  .mount("#app");
