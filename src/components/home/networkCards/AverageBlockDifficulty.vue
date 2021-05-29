<template>
  <button class="network-card">
    <div class="network-card-wrapper">
      <div class="icon-field">
        <div class="icon-base">
          <fa :icon="showIcon" class="fa-2x" />
        </div>
      </div>
      <div class="content-field">
        <p class="data-text">{{ dataText }}</p>
        <p class="title-text">{{ titleText }}</p>
      </div>
    </div>
  </button>
</template>

<script>
import { computed } from "vue";
import { useQuery, useResult } from "@vue/apollo-composable";
import { gql } from "@apollo/client";

export default {
  name: "AverageBlockDifficulty",
  setup() {
    const showIcon = "tachometer-alt";
    const titleText = "Average Block Difficulty";

    // Query set amount of block difficulty and use to create an average
    const query = gql`
      query averageDifficulty {
        chainQuery {
          blockQuery {
            blocks(limit: 20, desc: true) {
              difficulty
            }
          }
        }
      }
    `;

    const { result, loading, error } = useQuery(query);
    const blocks = useResult(
      result,
      null,
      (data) => data.chainQuery.blockQuery.blocks
    );
    // const blocks = result.value;

    console.log(result);
    console.log(blocks);

    const AverageBlockDiffictulty = computed(() => {
      if (this.blocks.length === 0) {
        return 0;
      }
      return (
        this.blocks.difficulty.reduce((sum, v) => sum + v.score, 0) / this.blocks.length
      );
    });

    console.log(AverageBlockDiffictulty);
    // const dataText = "hi";

    return { showIcon, titleText, loading, error };
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.network-card {
  width: 292px;
  height: 94px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 1px;
  border-radius: 15px;
  background-color: $dark-button-component;
  margin: 0 auto;
}

.network-card:first-child {
  margin-top: 0 !important;
  margin-left: 0 !important;
}

.network-card:last-child {
  margin-bottom: 0 !important;
  margin-right: 0 !important;
}

.network-card:hover {
  background: linear-gradient(
      -90deg,
      $dark-button-component,
      $dark-button-component
    ),
    linear-gradient(90deg, $dark-button-component 0%, #11a8fd 100%);
  background-origin: border-box;
  background-clip: content-box, border-box;
}

.network-card:active {
  filter: brightness(120%);
}

.network-card-wrapper {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  gap: 0;
  padding: 8px 16px;
  border-radius: 15px;
}

.icon-field {
  width: 64px;
  height: 64px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 0;
  padding: 0;
  border-radius: 8px;
  background-color: $dark-section-bg;
}

.icon-base {
  color: $grayscale-off-white;
}

.content-field {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  gap: 10px;
  padding: 0 0 0 12px;
}

.data-text {
  height: 29px;
  flex-grow: 0;
  text-align: left;
  color: #ffffff;
  @include DesktopDisplay-X-Small-Bold;
}

.title-text {
  flex-grow: 0;
  opacity: 0.5;
  font-family: Aller;
  font-size: 14px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #ffffff;
}
</style>
