<template>
  <div class="mailbox">
    <div class="header">
      <div class="icon-field">
        <fa icon="mail-bulk" class="fa-lg" />
      </div>
      <div class="title-text">
        <p class="title">Mailbox</p>
      </div>
      <div class="button-text">
        <p class="view-all">View All</p>
      </div>
    </div>
    <div class="mail-entry-field">
      <!-- v-for loop for each mail in mailbox -->
      <div class="mail-entry">
        <div class="icon-field">
          <!-- Mail unread/read [if-true: open, if-false: closed] -->
          <fa icon="envelope" class="fa-md" />
          <!-- <fa icon="envelope-open" class="fa-md" /> -->
        </div>
        <div class="title-text">
          <div class="message-field">
            <p class="message">You have sold an item!</p>
          </div>
          <div class="time-field">
            <div class="clock-icon">
              <fa icon="clock" class="fa-xs" />
            </div>
            <p class="time">12:10 AM</p>
          </div>
        </div>
        <div class="fav-field">
          <div class="favorite-icon">
            <!-- Favorite [if-true: solid, if-false: outline] -->
            <fa icon="heart" class="fa-sm" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Mailbox",
  components: {},
  props: {},
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/default-theme.scss";

.mailbox {
  height: 150px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
  gap: 8px;
  padding: 16px 12px;
  border-radius: 9px;
  background-color: $dark-button-component;
}
.header {
  height: 52px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 6px 24px 6px 8px;
  border-radius: 5px;
  background-color: $dark-section-bg;
}
.icon-field {
  width: 40px;
  height: 40px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 10px 9px;
  border-radius: 4px;
  color: $grayscale-off-white;
  background-color: $dark-secondary-component;
}
.title-text {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 0;
  padding: 0 0 0 12px;
  color: $grayscale-off-white;
}
.title {
  flex-grow: 0;
  text-align: left;
  color: #ffffff;
  @include DesktopText-X-Small;
}
.button-text {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
}
.view-all {
  flex-grow: 0;
  font-family: Aller;
  font-size: 10px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #a848f7;
}
.mail-entry-field {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: stretch;
  gap: 8px;
  padding: 0;
}
.mail-entry {
  height: 58px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 8px;
  border-radius: 7px;
  background-color: $dark-main-ui;
}
.icon-field {
  width: 40px;
  height: 40px;
  flex-grow: 0;
  padding: 10px 10px 12px;
  border-radius: 4px;
  background-color: rgba(19, 19, 30, 0.7);
}
.message-field {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0;
}
.message {
  flex-grow: 0;
  text-align: left;
  color: #ffffff;
  @include DesktopText-XX-Small;
}
.time-field {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 8px;
}
.clock-icon {
  display: flex;
  align-items: center;
  font-size: 0.8rem;
}

.time {
  flex-grow: 0;
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
.fav-field {
  width: 24px;
  height: 24px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 3px;
  background-color: $dark-section-bg;
  margin: 0 16px 0 0;
}
.favorite-icon {
  flex-grow: 0;
  color: $grayscale-off-white;
  font-size: 0.9rem;
}
</style>
