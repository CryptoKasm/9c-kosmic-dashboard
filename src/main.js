import { createApp, provide, h } from "vue";
import App from "./App.vue";
import router from "./router";
import { ApolloClient, InMemoryCache } from "@apollo/client";
import { DefaultApolloClient } from "@vue/apollo-composable";
import { library } from "@fortawesome/fontawesome-svg-core";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import VueProgressBar from "@aacassandra/vue3-progressbar";

// Add Font-Awesome-Icon library
library.add(fas);

// Create the default Apollo Client
const defaultClient = new ApolloClient({
  uri: "http://localhost:23075/graphql/",
  // https://9c-main-full-state.planetarium.dev/ui/playground
  cache: new InMemoryCache({
    typePolicies: {
      UnconventionalRootQuery: {
        queryType: true,
        mutationType: true,
        subscriptionType: true,
      },
      StateQuery: {
        keyFields: [],
      },
    },
  }),
});

const VueProgressBarOptions = {
  color: "#bffaf3",
  failedColor: "#874b4b",
  thickness: "5px",
  transition: {
    speed: "0.2s",
    opacity: "0.6s",
    termination: 300,
  },
  autoRevert: true,
  location: "left",
  inverse: false,
};

// Create App (main)
createApp({
  setup() {
    provide(DefaultApolloClient, defaultClient);
  },
  render() {
    return h(App);
  },
})
  .use(VueProgressBar, VueProgressBarOptions)
  .use(router)
  .component("fa", FontAwesomeIcon)
  .mount("#app");
