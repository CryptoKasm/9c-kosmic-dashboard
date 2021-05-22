import { createRouter, createWebHistory } from "vue-router";
import Home from "@/views/Home.vue";
import Explorer from "@/views/Explorer.vue";
import Character from "@/views/Character.vue";
import Marketplace from "@/views/Marketplace.vue";
import Node from "@/views/Node.vue";
import BugReport from "@/views/BugReport.vue";
import Settings from "@/views/Settings.vue";
import Playground from "@/views/Playground.vue";

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/explorer",
    name: "Explorer",
    component: Explorer,
  },
  {
    path: "/character",
    name: "Character",
    component: Character,
  },
  {
    path: "/marketplace",
    name: "Marketplace",
    component: Marketplace,
  },
  {
    path: "/node",
    name: "Node",
    component: Node,
  },
  {
    path: "/bug-report",
    name: "BugReport",
    component: BugReport,
  },
  {
    path: "/settings",
    name: "Settings",
    component: Settings,
  },
  {
    path: "/playground",
    name: "Playground",
    component: Playground,
  },
  // {
  //   path: "/about",
  //   name: "About",
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () =>
  //     import(/* webpackChunkName: "about" */ "../views/About.vue"),
  // },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
