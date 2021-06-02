<template>
  <div class="character-peek">
    <div class="character-selector">
      <div class="left-field">
        <div class="left-button">
          <fa icon="chevron-left" class="fa-md left-arrow" />
        </div>
      </div>
      <div class="center-field">
        <p class="selector-text">Select Character</p>
      </div>
      <div class="right-field">
        <div class="right-button">
          <fa icon="chevron-right" class="fa-md right-arrow" />
        </div>
      </div>
    </div>

    <div v-if="loading" class="loading">Loading...</div>
    <div v-else-if="error" class="error">Oops: {{ error.message }}</div>
    <div v-else-if="characters">
      <div
        class="character-entries"
        v-for="(character, key, index) in characters"
        :value="character.value"
        :key="key"
        :index="index"
      >
        <!-- How do i calculate CP and Prosperity?? -->
        <Details
          characterImage="./assets/images/characterImgs/default.png"
          :characterName="character.name"
          :characterLvl="character.level"
          :characterCP="characterCP"
          :characterXP="character.exp"
          :characterProsperity="characterProsperity"
          :characterAP="character.actionPoint"
        />
        <Blacksmithing />
        <Mailbox />
      </div>
    </div>
  </div>
</template>

<script>
import { useQuery, useResult } from "@vue/apollo-composable";
import { gql } from "@apollo/client";

import Details from "@/components/characterPeek/Details.vue";
import Blacksmithing from "@/components/characterPeek/Blacksmithing.vue";
import Mailbox from "@/components/characterPeek/Mailbox.vue";

export default {
  name: "CharacterPeek",
  components: {
    Details,
    Blacksmithing,
    Mailbox,
  },
  setup() {
    const characterCP = 86241;
    const characterProsperity = 800;

    const charactersQuery = gql`
      query charactersQuery {
        stateQuery {
          agent(address: "0x39533a6914457a25b0Aa75a63fd0B6F95E2d0843") {
            avatarStates {
              address
              name
              level
              exp
              actionPoint
            }
          }
        }
      }
    `;

    const { result, loading, error } = useQuery(charactersQuery);
    const characters = useResult(
      result,
      null,
      (data) => data.stateQuery.agent.avatarStates
    );

    console.log(result);

    return { characters, characterCP, characterProsperity, loading, error };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.character-peek {
  width: 436px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 16px 32px 16px;
  border-radius: 15px;
  background-color: rgba(19, 19, 30, 0.7);
}

.character-selector {
  height: 40px;
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  gap: 0;
  border-radius: 7px;
  background-color: $dark-button-component;
  margin: 0 0 16px 0;
}

.left-field,
.right-field {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-end;
  align-items: center;
  gap: 0;
  padding: 0 4px;
}

.left-button,
.right-button {
  width: 32px;
  height: 32px;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 7px;
  color: $grayscale-off-white;
  background-color: $dark-section-bg;
}

.left-button:hover,
.right-button:hover {
  background-color: #2e3347;
}

.left-button:active,
.right-button:active {
  filter: brightness(120%);
}

.left-arrow,
.right-arrow {
  width: 14px;
  height: 14px;
  flex-grow: 0;
}

.center-field {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
}

.selector-text {
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

.character-entries {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 16px;
}

.loading,
.error {
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
  align-self: stretch;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
}
</style>
