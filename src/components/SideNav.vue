<template>
  <div class="side-nav">
    <div class="logo-frame">
      <div class="rocket-logo">
        <router-link :to="{ name: 'Home' }">
          <Logo />
        </router-link>
      </div>
    </div>
    <div class="top-frame">
      <div class="main-menu-frame">
        <!-- Home -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Home' }">
            <div class="icon-base">
              <fa icon="home" class="fa-md" />
            </div>
          </router-link>
        </div>
        <!-- Explorer -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Explorer' }">
            <div class="icon-base">
              <fa icon="compass" class="fa-md" />
            </div>
          </router-link>
        </div>
        <!-- Character -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Character' }">
            <div class="icon-base">
              <fa icon="user" class="fa-md" />
            </div>
          </router-link>
        </div>
        <!-- Marketplace -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Marketplace' }">
            <div class="icon-base">
              <fa icon="store" class="fa-md" />
            </div>
          </router-link>
        </div>
        <!-- Node -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Node' }">
            <div class="icon-base">
              <fa icon="cube" class="fa-md" />
            </div>
          </router-link>
        </div>
      </div>
      <div class="spacer-frame">
        <div class="spacer"></div>
      </div>
    </div>
    <div class="sub-menu-frame">
      <div class="sub-menu">
        <div class="menu-wrapper">
          <div class="icon-base">
            <fa icon="th-large" class="fa-md" />
          </div>
        </div>
        <div class="icon-wrapper">
          <div class="icon-base">
            <fa icon="calculator" class="fa-xs" />
          </div>
        </div>
        <div class="icon-wrapper">
          <div class="icon-base">
            <fa icon="stopwatch" class="fa-xs" />
          </div>
        </div>
      </div>
    </div>
    <div class="bottom-frame">
      <div class="spacer-frame">
        <div class="spacer"></div>
      </div>
      <div class="power-frame">
        <div class="sub-menu-actions">
          <div class="icon-sub-wrapper">
            <div class="icon-base">
              <fa icon="unlock" class="fa-xs" />
            </div>
          </div>
          <div class="icon-sub-wrapper">
            <div class="icon-base">
              <fa icon="sync" class="fa-xs" />
            </div>
          </div>
        </div>
      </div>
      <div class="spacer-frame">
        <div class="spacer"></div>
      </div>
      <div class="settings-frame">
        <!-- Bug Report -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'BugReport' }">
            <div class="icon-base">
              <fa icon="bug" class="fa-md" />
            </div>
          </router-link>
        </div>
        <!-- Settings -->
        <div class="button-wrapper">
          <router-link :to="{ name: 'Settings' }">
            <div class="icon-base">
              <fa icon="cogs" class="fa-md" />
            </div>
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Logo from "@/components/sidenav/Logo.vue";
// import NavButton from "@/components/sidenav/NavButton.vue";

export default {
  name: "SideNav",
  components: {
    Logo,
  },
  data() {
    return {
      homeHoverHover: false,
      explorerHover: false,
      characterHover: false,
      marketplaceHover: false,
      nodeHover: false,
    };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.side-nav {
  width: 80px;
  min-height: 100%;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 0;
}

.logo-frame {
  height: 80px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  background-color: $dark-main-ui;
}

.rocket-logo {
  overflow: hidden;
  height: 48px;
  width: 26.86px;
  position: relative;
}

.logo {
  height: 100%;
}

.top-frame {
  height: 338px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 2px 0 0;
}

.main-menu-frame {
  height: 320px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  align-items: stretch;
  gap: 12px;
  padding: 24px 0 8px;
  background-color: $dark-main-ui;
}

.button-wrapper {
  height: 48px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
}

.button-wrapper a {
  width: 48px;
  height: 48px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 15px;
  background-color: $dark-button-component;
}

.button-wrapper a:hover {
  filter: brightness(150%);
}

.button-wrapper a.router-link-exact-active {
  background-image: linear-gradient(-45deg, #1b4bcf, #6db0ff);
}

.icon-base {
  color: $grayscale-off-white;
}

.spacer-frame {
  height: 16px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 8px;
  padding: 7.5px 0;
  background-color: $dark-main-ui;
}

.spacer {
  width: 44px;
  height: 1px;
  flex-grow: 0;
  border-radius: 18px;
  background-image: linear-gradient(
    to top,
    rgba(255, 255, 255, 0),
    rgba(255, 255, 255, 0.5),
    rgba(255, 255, 255, 0)
  );
}

.sub-menu-frame {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
  gap: 16px;
  padding: 8px 0;
  background-color: $dark-main-ui;
}

.sub-menu {
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 2px;
  border-radius: 15px;
  background-color: $dark-button-component;
}

.menu-wrapper {
  width: 44px;
  height: 44px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 15px;
  box-shadow: 0 4px 8px 0 rgba(50, 50, 71, 0.01),
    0 4px 4px 0 rgba(0, 0, 0, 0.08);
  border: solid 0.5px $dark-main-ui;
  // background-image: linear-gradient(-45deg, #5f2eea, #bca4ff);
  background-image: linear-gradient(-45deg, #ed2e7e, #ff9e89);
}

.icon-wrapper {
  overflow: hidden;
  border-radius: 15px;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 44px;
  width: 44px;
}

.icon-sub-wrapper {
  width: 44px;
  height: 44px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 15px;
}

.icon-sub-menu {
  width: 20px;
  height: 20px;
  flex-grow: 0;
  background-color: #ffffff;
}

.bottom-frame {
  height: 272px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0 0 16px;
  background-color: $dark-main-ui;
}

.power-frame {
  width: 80px;
  height: 108px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 8px;
  padding: 8px 0;
}

.sub-menu-actions {
  width: 48px;
  height: 92px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 2px;
  border-radius: 15px;
  background-color: $dark-button-component;
}

.settings-frame {
  height: 116px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: stretch;
  gap: 12px;
  padding: 8px 0 0;
}
</style>
