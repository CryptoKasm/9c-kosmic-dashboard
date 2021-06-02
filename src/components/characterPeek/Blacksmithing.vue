<template>
  <div class="blacksmithing-status">
    <div class="title-text">
      <p class="title">Blackmithing</p>
    </div>
    <div class="progress-bar-field">
      <!-- Progressbar loop for each slot -->
      <div class="progress-bar">
        <div class="item-text">
          <p class="item">Item Name</p>
        </div>
        <div class="progress-text">
          <p class="progress">
            <strong class="item-number-emphasis">0</strong> / 700
          </p>
        </div>
      </div>
      <div class="progress-bar">
        <div class="item-text">
          <p class="item">Item Name</p>
        </div>
        <div class="progress-text">
          <p class="progress">
            <strong class="item-number-emphasis">0</strong> / 700
          </p>
        </div>
      </div>
      <div class="progress-bar">
        <div class="item-text">
          <p class="item">Item Name</p>
        </div>
        <div class="progress-text">
          <p class="progress">
            <strong class="item-number-emphasis">0</strong> / 700
          </p>
        </div>
      </div>
      <div class="progress-bar">
        <div class="item-text">
          <p class="item">Item Name</p>
        </div>
        <div class="progress-text">
          <p class="progress">
            <strong class="item-number-emphasis">0</strong> / 700
          </p>
        </div>
      </div>
      <!-- End loop -->
    </div>
  </div>
</template>

<script>
export default {
  name: "Blacksmithing",
  components: {},
  props: {
    itemName: String,
    itemCurrentProgress: Number,
    itemMaxProgress: Number,
  },
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/default-theme.scss";

.blacksmithing-status {
  height: 177px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
  gap: 8px;
  padding: 16px 24px;
  border-radius: 9px;
  background-color: $dark-button-component;
}

.title-text {
  height: 17px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 0;
  padding: 0;
}

.title {
  width: 91px;
  height: 17px;
  flex-grow: 0;
  font-family: Aller;
  font-size: 14px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: 0.75px;
  text-align: left;
  color: #ffffff;
}

.progress-bar-field {
  height: 120px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 8px;
  padding: 0;
}

.progress-bar {
  height: 24px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 0 8px;
  border-radius: 5px;
  background-color: $dark-section-bg;
}

.item-text {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0;
}

.item {
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

.progress-text {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0;
}

.progress {
  width: 67px;
  height: 12px;
  flex-grow: 0;
  font-family: Aller;
  font-size: 10px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: right;
  color: #90929a;
}

.item-number-emphasis {
  font-family: "Aller";
  font-size: 10px;
  font-weight: 400;
  line-height: normal;
  color: rgba(66, 182, 241, 1);
}
</style>
