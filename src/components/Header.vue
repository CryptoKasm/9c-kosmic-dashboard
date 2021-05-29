<template>
  <div class="header">
    <div class="menu-frame">
      <div class="nav-links-frame">
        <button class="nav-link">
          <router-link :to="{ name: 'Home' }">Dashboard</router-link>
        </button>
        <button class="nav-link">
          <a href="https://wiki.nine-chronicles.com/" target="_blank">Wiki</a>
        </button>
        <button class="nav-link">
          <router-link :to="{ name: 'Playground' }"
            >GraphQL Playground</router-link
          >
        </button>
      </div>
    </div>
    <!-- <div class="search-frame">
      <div class="spacer-frame">
        <div class="spacer"></div>
      </div>
      <div class="search">
        <div class="search-contents">
          <button class="search-icon">
            <fa icon="search" class="fa-sm" />
          </button>
          <input
            v-model="message"
            placeholder="Search..."
            class="text-search"
          />
        </div>
      </div>
    </div> -->
    <div class="align-right">
      <div class="ncg-frame">
        <div class="ncg-main">
          <div class="ncg-display">
            <img
              alt="NCG"
              class="icon-coin"
              src="@/assets/images/ncg-coin.png"
            />
            <p class="subtext">{{ ncgAmount }} NCG</p>
          </div>
          <div class="ncg-actions">
            <!-- <button class="ncgButton">
              <p class="subtext">Buy</p>
            </button>
            <button class="ncgButton">
              <p class="subtext">Sell</p>
            </button> -->
            <button class="ncgButton">
              <p class="subtext">Transfer</p>
            </button>
          </div>
        </div>
      </div>
      <div class="accountframe-wrapper">
        <div class="account-frame">
          <div class="publicid-tag">
            <p class="text-publicid-tag">Public ID</p>
          </div>
          <div class="publicid-number">
            <p id="item-to-copy" class="text-publicid-number">{{ publicID }}</p>
            <button :onClick="copyToClipboard" class="copy-button">
              <fa icon="copy" class="fa-sm" />
            </button>
          </div>
        </div>
      </div>
      <div class="icon-frame">
        <button class="iconbg">
          <div class="icon-notification">
            <div class="icon-base">
              <fa icon="bell" class="fa-md" />
            </div>
            <div class="ellipse"></div>
            <p class="notify-count">{{ notifyCount }}</p>
          </div>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from "vue";
import { useQuery, useResult } from "@vue/apollo-composable";
import { gql } from "@apollo/client";

export default {
  name: "Header",
  setup() {
    const publicID = ref("0xf5eB9FCbe5D2A658A87b517511f14698ADd28Efa");
    // const ncgAmount = ref("10,504");
    const notifyCount = ref("21");
    
    const AccountData = gql`
      query checkNCGBalance {
        goldBalance(address: "0xf5eB9FCbe5D2A658A87b517511f14698ADd28Efa")
      }
    `;

    const { result } = useQuery(AccountData);
    const ncgAmount = useResult(result, null, (data) => data.goldBalance);

    console.log(ncgAmount);

    return { publicID, ncgAmount, notifyCount };
  },
  methods: {
    copyToClipboard() {
      const str = document.getElementById("item-to-copy").innerText;
      const el = document.createElement("textarea");
      el.value = str;
      el.setAttribute("readonly", "");
      el.style.position = "absolute";
      el.style.left = "-9999px";
      document.body.appendChild(el);
      el.select();
      document.execCommand("copy");
      document.body.removeChild(el);
    },
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.header {
  width: 100%;
  height: 64px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 0;
  background-color: $dark-main-ui;
}

.menu-frame {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 32px;
  padding: 0 56px;
}

.nav-links-frame {
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 63.5px;
  padding: 0;
}

.nav-link a {
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  height: 54px;
  text-align: left;
  color: rgb(206, 206, 206);
  @include DesktopLink-Small;
}

.nav-link a.router-link-exact-active {
  color: white;
}

.nav-link a:hover {
  color: $grayscale-off-white;
}

.search-frame {
  width: 424px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 56px;
  padding: 0 32px 0 0;
}

.spacer-frame {
  width: 16px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0 7.5px;
}

.spacer {
  width: 1px;
  height: 44px;
  flex-grow: 0;
  border-radius: 18px;
  background-image: linear-gradient(
    to top,
    rgba(255, 255, 255, 0),
    rgba(255, 255, 255, 0.5),
    rgba(255, 255, 255, 0)
  );
}

.search {
  width: 320px;
  height: 42px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 16px;
  padding: 8px 16px;
  border-radius: 12px;
  background-color: $dark-section-bg;
}

.search-contents {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 20px;
  padding: 0 0 0 8px;
}

.search-contents .search-icon,
.search-contents .text-search {
  color: rgb(206, 206, 206);
}

.search-contents .search-icon:hover,
.search-contents .text-search:hover {
  color: $grayscale-off-white;
}

.text-search {
  flex-grow: 0;
  text-align: left;
  @include DesktopText-XX-Small;
}

.align-right {
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0 24px 0 0;
}

.ncg-frame {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 24px;
  padding: 0 16px 0 0;
}

.ncg-main {
  height: 42px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 64px;
  padding: 0 3px 0 16px;
  border-radius: 10px;
  background-color: $dark-section-bg;
}

.ncg-display {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 12px;
  padding: 0;
  border-radius: 12px;
}

.ncg-actions {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 8px;
  padding: 0;
  border-radius: 12px;
}

.icon-coin {
  width: 24px;
  height: 24px;
  flex-grow: 0;
}

.subtext {
  flex-grow: 0;
  text-align: left;
  color: $grayscale-off-white;
  @include DesktopText-XX-Small;
}

.ncgButton {
  width: 86px;
  height: 34px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 9px;
  background-image: linear-gradient(-45deg, #5f2eea, #bca4ff);
}

.ncgButton:hover {
  filter: brightness(105%);
}

.ncgButton:active {
  filter: brightness(120%);
}

.accountframe-wrapper {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 24px;
  padding: 0 16px 0 0;
}

.account-frame {
  height: 42px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 8px;
  padding: 0 4px;
  border-radius: 10px;
  background-color: $dark-section-bg;
}

.publicid-tag {
  height: 34px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 8px;
  padding: 0 20px;
  border-radius: 9px;
  background-color: $dark-button-component;
}

.text-publicid-tag {
  height: 24px;
  flex-grow: 0;
  text-align: right;
  color: $grayscale-off-white;
  @include DesktopText-XX-Small;
}

.publicid-number {
  max-width: 200px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 16px;
  padding: 0 20px 0 12px;
  overflow: hidden;
}

.text-publicid-number {
  height: 24px;
  flex-grow: 0;
  text-align: left;
  color: $grayscale-off-white;
  @include DesktopText-XX-Small;
  overflow: hidden;
}

.copy-button {
  color: $grayscale-off-white;
}

.copy-button:hover {
  color: rgba(17, 168, 253, 1);
}

.copy-button:active {
  color: rgb(147, 211, 248);
}

.icon-frame {
  display: flex;
  align-items: center;
  height: 82px;
}

.icon-base {
  color: $grayscale-off-white;
}

.iconbg {
  width: 42px;
  height: 42px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 10px;
  background-color: $dark-section-bg;
}

.iconbg:hover {
  background-color: $dark-button-component;
}

.iconbg:active {
  background-color: $dark-button-component;
  filter: brightness(120%);
}

.icon-notification {
  padding: 3px 1px 0 0;
  position: relative;
}

.ellipse {
  width: 15px;
  height: 15px;
  background-color: rgba(17, 168, 253, 1);
  border-radius: 50%;
  position: absolute;
  left: 6px;
  top: -2px;
  border: 1px solid rgba(19, 19, 30, 0.7);
}

.notify-count {
  width: 10px;
  height: 10px;
  flex-grow: 0;
  font-family: Allerta;
  font-size: 9px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  position: absolute;
  left: 10px;
  top: 1px;
  color: white;
}
</style>
