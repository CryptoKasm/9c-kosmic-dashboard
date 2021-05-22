<template>
  <div id="autoLayout">
    <SideNav />
    <div id="mainWrapper">
      <Header />
      <Content />
    </div>
  </div>
</template>

<script>
import SideNav from "@/components/SideNav.vue";
import Header from "@/components/Header.vue";
import Content from "@/components/Content.vue";

export default {
  name: "App",
  components: {
    SideNav,
    Header,
    Content,
  },
};
</script>

<style lang="scss">
@import "./assets/scss/default-theme.scss";

* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}

html {
  background-color: rgba(24, 28, 43, 1);
  background-image: url("./assets/images/backgrounds/world-5.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  filter: hue-rotate(160deg);
}

#app {
  min-height: 100vh;
  filter: hue-rotate(-160deg);
  background-color: rgba(24, 28, 43, 0.5);
}

#autoLayout {
  min-height: 100vh; //Temp fix
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 2px;
  padding: 0;
}

#mainWrapper {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 2px;
  padding: 0;
  min-height: 100vh;
}
</style>
