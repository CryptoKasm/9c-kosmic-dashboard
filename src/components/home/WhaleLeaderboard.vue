<template>
  <div class="leaderboard-frame">
    <div class="header">
      <div class="left">
        <p class="title-text">Top NCG Whales</p>
      </div>
      <div class="right">
        <div class="category-text">
          <p class="leaderboard-text">LEADERBOARD</p>
        </div>
      </div>
    </div>
    <div class="line-field"><div class="line"></div></div>
    <div class="entries-field">
      <div
        class="entries-list"
        v-for="account in accounts"
        :value="account.value"
        :key="account.value"
      >
        <LeaderboardEntry
          :accountPublicID="account.PublicID"
          :accountCharacters="account.Characters"
          :accountProfileImg="account.ProfileImg"
          :accountRank="account.Rank"
          :accountNCG="account.NCG"
        />
      </div>
    </div>
  </div>
</template>

<script>
import LeaderboardEntry from "@/components/home/LeaderboardEntry.vue";

export default {
  name: "WhalesLeaderboard",
  components: {
    LeaderboardEntry,
  },
  data() {
    return {
      accounts: [
        {
          PublicID: "0xf5eB9FCbe5D2A658A87b517511f14698ADd28Efa",
          Characters: [ "TripLo #7r40", "Fuxwithme #8f9e", "EMPTY" ],
          ProfileImg:
            "https://static.overlay-tech.com/assets/9bec0aad-cae7-4730-831e-577cff246de6.png",
          Rank: "01",
          NCG: "340,504",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.leaderboard-frame {
  width: 647px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 2px 0 0;
  border-radius: 9px;
  background-color: $dark-button-component;
}

.header {
  min-height: 48px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 0 24px;
}

.left {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0;
}

.title-text {
  flex-grow: 0;
  font-family: Aller;
  font-size: 18px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #ffffff;
}

.right {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0;
}

.category-text {
  width: 113px;
  height: 32px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 10px;
  padding: 0;
  border-radius: 5px;
  border: solid 0.5px #ffffff;
}

.leaderboard-text {
  flex-grow: 0;
  opacity: 0.5;
  font-family: Aller;
  font-size: 12px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #ffffff;
}

.line-field {
  height: 2px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
}

.line {
  height: 1px;
  flex-grow: 1;
  opacity: 0.05;
  background-color: #ffffff;
}

.entries-field {
  padding: 12px 24px;
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;
  align-self: stretch;
  gap: 8px;
}

.entries-list {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 0;
  align-self: stretch;
}
</style>
