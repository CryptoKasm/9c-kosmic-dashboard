<template>
  <button class="entry">
    <div class="entry-wrapper">
      <div class="rank-field">
        <p class="rank-text">{{ accountRank }}</p>
      </div>
      <div class="profile-img-field">
        <img
          :alt="accountProfileImgAlt"
          class="mask-shape"
          :src="accountProfileImg"
        />
      </div>
      <div class="profile-field">
        <div class="account-field">
          <p class="account-text">{{ accountPublicID }}</p>
        </div>
        <div class="character-field">
          <div
            class="character-name"
            v-for="characterName in accountCharacters"
            :value="characterName.value"
            :key="characterName.value"
          >
            <p class="name-text">{{ characterName }}</p>
          </div>
          <!-- <div class="character-name">
            <p class="name-text">TripLo #7df3</p>
          </div>
          <div class="character-name">
            <p class="name-text">Fuxwithme #7df3</p>
          </div>
          <div class="character-name">
            <p class="name-text">EMPTY</p>
          </div> -->
        </div>
      </div>
      <div class="data-field">
        <div class="databg">
          <!-- Query: account gold balance -->
          <p v-if="accountNCG" class="data-text">{{ accountNCG }} NCG</p>

          <!-- Query: account total xp -->
          <p v-if="accountXP" class="data-text">{{ accountXP }} XP</p>
        </div>
      </div>
    </div>
  </button>
</template>

<script>
export default {
  name: "Leaderboard-Entry",
  props: {
    accountPublicID: String,
    accountCharacters: Array,
    accountRank: Number,
    accountProfileImg: String,
    accountNCG: Number,
    accountXP: Number,
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.entry {
  height: 48px;
  overflow: hidden;
  border-radius: 10px;
  display: flex;
  align-items: center;
  align-self: stretch;
  position: relative;
  padding: 1px;
  background-color: $dark-secondary-component;
}

.entry:hover {
  background: linear-gradient(
      90deg,
      $dark-secondary-component,
      $dark-secondary-component
    ),
    linear-gradient(90deg, $dark-secondary-component 0%, #11a8fd 100%);
  background-origin: border-box;
  background-clip: content-box, border-box;
}

.entry:active {
  filter: brightness(120%);
}

.entry-wrapper {
  overflow: hidden;
  border-radius: 10px;
  display: flex;
  align-items: center;
  align-self: stretch;
}

.rank-field {
  padding: 0 12px 0 12px;
  display: flex;
  align-items: center;
  align-self: stretch;
}

.rank-text {
  font-family: "Aller";
  font-size: 22px;
  font-weight: 700;
  line-height: normal;
  color: rgba(255, 255, 255, 1);
  opacity: 0.3;
}

.profile-img-field {
  padding: 0 16px 0 0;
  display: flex;
  align-items: center;
  justify-content: center;
  align-self: stretch;
}

.mask-shape {
  width: 32px;
  height: 32px;
}

.profile-field {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;
  flex: 1;
  align-self: stretch;
}

.account-field {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: center;
  flex: 0;
  align-self: stretch;
}

.account-text {
  font-family: Aller;
  font-size: 13px;
  font-weight: bold;
  line-height: 1.71;
  letter-spacing: 0.75px;
  text-decoration: none;
  color: rgba(255, 255, 255, 1);
}

.character-field {
  padding: 0 0 0 8px;
  display: flex;
  align-items: center;
  align-self: stretch;
}

.character-name {
  background-color: rgba(25, 36, 57, 0.9);
  overflow: hidden;
  border-radius: 5px;
  padding: 0 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 16px;
  &:not(:last-of-type) {
    margin-right: 16px;
  }
}

.name-text {
  font-family: "Pangram";
  font-size: 10px;
  font-weight: 400;
  line-height: normal;
  color: rgba(28, 146, 255, 1);
}

.data-field {
  padding: 0 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: absolute;
  right: 0;
}

.databg {
  background-color: rgba(25, 36, 57, 0.9);
  overflow: hidden;
  border-radius: 5px;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 30px;
  width: 112px;
}

.data-text {
  font-family: "Pangram";
  font-size: 12px;
  font-weight: 400;
  line-height: normal;
  color: rgba(28, 146, 255, 1);
}
</style>
