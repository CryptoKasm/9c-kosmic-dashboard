<template>
  <div class="character-details">
    <div class="svg-header"></div>
    <div class="character-image">
      <img
        alt=""
        class="image-shape"
        src="@/assets/images/characterImgs/default.png"
      />
      <!-- <div class="image-shape"></div> -->
    </div>
    <div class="character-info">
      <p class="character-name">{{ characterName }}</p>
      <div class="sub-text">
        <p class="character-lvl">Level {{ characterLvl }}</p>
        <p class="character-lvl">|</p>
        <p class="character-lvl">CP {{ characterCP }}</p>
      </div>
    </div>
    <div class="character-status">
      <div class="bar-status">
        <div class="progress-bar"></div>
        <div class="text">
          <div class="label"><p class="xp">XP</p></div>
          <div class="value">
            <p class="number">
              <strong class="number-emphasis">{{ characterXP }}</strong> /
              {{ characterXPMax }}
            </p>
          </div>
        </div>
      </div>
      <div class="bar-status">
        <div class="progress-bar"></div>
        <div class="text">
          <div class="label">
            <p class="xp">Prosperity</p>
          </div>
          <div class="value">
            <p class="number">
              <strong class="number-emphasis">{{ characterProsperity }}</strong>
              / {{ characterProsperityMax }}
            </p>
          </div>
        </div>
      </div>
      <div class="bar-status">
        <div class="progress-bar"></div>
        <div class="text">
          <div class="label"><p class="xp">AP</p></div>
          <div class="value">
            <p class="number">
              <strong class="number-emphasis">{{ characterAP }}</strong> /
              {{ characterAPMax }}
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Details",
  props: {
    characterImage: String,
    characterName: String,
    characterLvl: Number,
    characterCP: Number,
    characterXP: Number,
    characterProsperity: Number,
    characterAP: Number,
  },
  data() {
    return {
      characterXPMax: 300,
      characterProsperityMax: 1200,
      characterAPMax: 120,
    };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.character-details {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 16px 0;
  border-radius: 7px;
  background-color: $dark-button-component;
}

.svg-header {
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 150.45 24"><path d="M125.72,15.87C112.21,6,94.55,0,75.22,0s-37,6-50.49,15.87A41.88,41.88,0,0,1,0,24H150.45A41.88,41.88,0,0,1,125.72,15.87Z"/></svg>')
    top center no-repeat;
}

.character-image {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 0;
  border-radius: 30px;
}

.image-shape {
  width: 108px;
  height: 108px;
  flex-grow: 0;
  border-radius: 15px;
  // background-image: url("../../../assets/images/characterImgs/default.png");
}

.character-info {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap: 4px;
  padding: 10px 0 12px;
}

.character-name {
  flex-grow: 0;
  font-family: Aller;
  font-size: 18px;
  font-weight: bold;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: 0.75px;
  text-align: left;
  color: #ffffff;
}

.sub-text {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
  gap: 8px;
  padding: 0;
}

.character-lvl {
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

.character-status {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 8px;
  padding: 8px 24px;
}

.bar-status {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 4px;
  padding: 0;
}

.progress-bar {
  height: 24px;
  align-self: stretch;
  flex-grow: 0;
  border-radius: 5px;
  background-color: rgba(19, 19, 30, 0.7);
}

.text {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0 12px;
}

.label {
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0;
}

.xp {
  flex-grow: 0;
  opacity: 0.5;
  font-family: Aller;
  font-size: 10px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #ffffff;
}

.value {
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0;
}

.number {
  flex-grow: 0;
  font-family: Aller;
  font-size: 10px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #90929a;
}

.number-emphasis {
  font-family: "Aller";
  font-size: 10px;
  font-weight: 400;
  line-height: normal;
  color: rgba(66, 182, 241, 1);
}
</style>
