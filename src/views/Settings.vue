<template>
  <h3>Settings</h3>
</template>

<script>
export default {
  name: "Settings",
  components: {},
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

h3 {
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  height: 54px;
  text-align: left;
  color: white;
  @include DesktopDisplay-Large-Bold;
}
</style>
