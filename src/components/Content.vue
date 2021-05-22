<template>
  <div id="contentWrapper">
    <div id="content">
      <router-view />
    </div>
    <CharacterPeek />
  </div>
</template>

<script>
import CharacterPeek from "@/components/CharacterPeek.vue";

export default {
  name: "Content",
  components: {
    CharacterPeek,
  },
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/default-theme.scss";

#contentWrapper {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 0 24px 0 32px;
  background-color: rgba(26, 28, 44, 0.7);
}
#content {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 32px;
  padding: 32px 0 24px;
}
</style>
