<template>
  <div class="character">
    <h3>Character</h3>
  </div>
</template>

<script>
export default {
  name: "Character",
  components: {},
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.character {
  width: 1300px;
}

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
