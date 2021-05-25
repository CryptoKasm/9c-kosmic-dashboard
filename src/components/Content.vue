<template>
  <div id="contentWrapper">
    <div id="content">
      <transition name="slide">
        <router-view />
      </transition>
    </div>
    <!-- <CharacterPeek /> -->
  </div>
</template>

<script>
// import CharacterPeek from "@/components/CharacterPeek.vue";

export default {
  name: "Content",
  components: {
    // CharacterPeek,
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
  background-color: rgba(26, 28, 44, 0.7);
  padding: 0 16px 0 16px;
}
#content {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 24px 0 16px 0;
}

// // Transitions
// .slide-enter-active,
// .slide-leave-active {
//   transition: all 1s ease-out;
// }


// .slide-enter-to {
//   position: absolute;
//   top: 0;
// }


// .slide-enter-from {
//   position: absolute;
//   top: -100%;
// }


// .slide-leave-to {
//   position: absolute;
//   bottom: -100%;
// }


// .slide-leave-from {
//   position: absolute;
//   bottom: 0;
// }
</style>
