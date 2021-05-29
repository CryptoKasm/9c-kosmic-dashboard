<template>
  <div class="content-frame">
    <!-- News Articles -->
    <div class="news-articles">
      <!-- Need to add for loop, for each news article in rss feed -->
      <NewsArticle
        imageSrc="https://cdn-images-1.medium.com/max/1024/0*mVkJIoGjJcvEbsww.png"
        articleURL="https://ninechronicles.medium.com/monster-collection-muspelheim-the-realm-of-fire-part-2-b5c36e089b81"
        titleText="Monster Collection: Muspelheim, The Realm of Fire Part 2"
        sourceText="Medium"
        dateText="5/21/2021"
        summaryText="The second
        chapter begins with the opening of the 5th world known as Muspelheim, the
        Realm of Fire. Being the source of heat in all Nine Realms, Muspelheim
        introduces a completely new concept of Lizard monsters and a new glorious
        battlefield."
      />
      <NewsArticle
        imageSrc="https://cdn-images-1.medium.com/max/1024/0*mVkJIoGjJcvEbsww.png"
        articleURL="https://ninechronicles.medium.com/muspelheim-the-realm-of-fire-is-coming-soon-35a959c3fb20"
        titleText="Muspelheim, The Realm of Fire is coming soon"
        sourceText="Medium"
        dateText="5/18/2021"
        summaryText="The second chapter begins with the opening of the 5th world known as 
        Muspelheim, the Realm of Fire. Being the source of heat in all Nine Realms, 
        Muspelheim introduces a completely new concept of Lizard monsters and a new 
        glorious battlefield."
      />
      <NewsArticle
        imageSrc="https://cdn-images-1.medium.com/max/1024/0*0TRjyCajKGnsK9aJ"
        articleURL="https://ninechronicles.medium.com/development-update-blog-april-2021-21f1385fb1c"
        titleText="Muspelheim, The Realm of Fire is coming soon"
        sourceText="Medium"
        dateText="5/4/2021"
        summaryText="This month saw a number of small quality-of-life fixes, although 
        one major update this month was the roll out of the new Marketplace UI. 
        We also worked on a number of long-term features that are not yet ready for deployment."
      />
    </div>
    <!-- Leaderboards -->
    <div class="leaderboards">
      <PvPLeaderboard />
      <XPLeaderboard />
    </div>
    <!-- Network Cards -->
    <div class="network-cards">
      <div class="row-frame">
        <AverageBlockDifficulty />
      </div>
      <div class="row-frame">

      </div>
    </div>
  </div>
</template>

<script>
import NewsArticle from "@/components/home/NewsArticle.vue";
import PvPLeaderboard from "@/components/home/PvPLeaderboard.vue";
import XPLeaderboard from "@/components/home/XPLeaderboard.vue";
import AverageBlockDifficulty from "@/components/home/networkCards/AverageBlockDifficulty.vue";

export default {
  name: "Home",
  components: {
    NewsArticle,
    PvPLeaderboard,
    XPLeaderboard,
    AverageBlockDifficulty,
  },
};
</script>

<style lang="scss" scoped>
@import "@/assets/scss/default-theme.scss";

.content-frame {
  width: 1300px;
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 24px;
  margin: 0 auto;
}

.news-articles {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  gap: 0;
  padding: 0;
  // background-color: green;
}

.leaderboards {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 24px;
  padding: 0;
  // background-color: green;
}

.network-cards {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 24px;
  padding: 0;
  // background-color: green;
}

.row-frame {
  // height: 94px;
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  gap: 24px;
  padding: 0;
  // background-color: #ff5050;
}
</style>
