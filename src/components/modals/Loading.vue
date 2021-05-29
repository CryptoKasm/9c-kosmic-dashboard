<template>
  <div id="loading"></div>
</template>

<script>
export default {
  name: "Loading",
  components: {},
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/default-theme.scss";

#loading {
  width: 444px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-end;
  gap: 0;
  padding: 32px 0 24px 28px;
  background-color: rgba(19, 19, 30, 0.7);
}
</style>
