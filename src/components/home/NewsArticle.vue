<template>
  <a :href="articleURL" target="_blank" class="article">
    <div class="article-wrapper">
      <div class="image-shape">
        <img alt="" class="image" :src="imageSrc" />
      </div>
      <div class="article-info">
        <div class="meta-info">
          <div class="title-text">{{ titleText }}</div>
          <div class="sub-info">
            <p class="source-text">Source: {{ sourceText }}</p>
            <p class="date-text">{{ dateText }}</p>
          </div>
        </div>
        <p class="summary-text">
          {{ summaryText }}
        </p>
      </div>
    </div>
  </a>
</template>

<script>
export default {
  name: "NewsArticle",
  props: {
    imageSrc: String,
    articleURL: String,
    titleText: String,
    sourceText: String,
    dateText: String,
    summaryText: String,
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.article {
  width: 424px;
  height: 230px;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
  gap: 0;
  padding: 1px;
  border-radius: 15px;
  background-color: $dark-button-component;
  margin: 0 auto;
  text-decoration: none;
}

.article:first-child {
  margin-top: 0 !important;
  margin-left: 0 !important;
}

.article:last-child {
  margin-bottom: 0 !important;
  margin-right: 0 !important;
}

.article:hover {
  background: linear-gradient(
      90deg,
      $dark-button-component,
      $dark-button-component
    ),
    linear-gradient(90deg, $dark-button-component 0%, #11a8fd 100%);
  background-origin: border-box;
  background-clip: content-box, border-box;
}

.article:active {
  filter: brightness(120%);
}

.article-wrapper {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: flex-start;
  gap: 0;
  padding: 12px 16px 12px 12px;
  border-radius: 15px;
  margin: 0 auto;
}

.image-shape {
  width: 160px;
  height: 200px;
  margin-right: 12px;
}

.image-shape img {
  width: inherit;
  height: inherit;
  border-radius: 15px;
  object-fit: cover;
}

.article-info {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 0;
  padding: 12px 0 8px 0;
}

.meta-info {
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  gap: 8px;
  padding: 0;
  align-items: center;
}

.title-text {
  align-self: stretch;
  flex-grow: 0;
  font-family: Aller;
  font-size: 22px;
  font-weight: bold;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: $grayscale-off-white;
  text-decoration: none;
}

.sub-info {
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  gap: 52px;
  padding: 0 0 4px 0;
  font-family: Aller;
  font-size: 11px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
}

.source-text,
.date-text {
  flex-grow: 0;
  text-align: left;
  color: $grayscale-off-white;
}

.summary-text {
  align-self: stretch;
  flex-grow: 1;
  font-family: Aller;
  font-size: 10px;
  font-weight: normal;
  font-stretch: normal;
  font-style: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: $grayscale-off-white;
  padding: 0 4px;
}
</style>
