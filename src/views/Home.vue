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
        <AverageBlockTime />
        <DailyTransactions />
        <ActivePlayerAddresses />
      </div>
      <div class="row-frame">
        <TotalNCGCreated />
        <TotalBlocks />
        <TotalTransactions />
        <TotalPlayerAddresses />
      </div>
    </div>
  </div>
</template>

<script>
import NewsArticle from "@/components/home/NewsArticle.vue";
import PvPLeaderboard from "@/components/home/PvPLeaderboard.vue";
import XPLeaderboard from "@/components/home/XPLeaderboard.vue";
import AverageBlockDifficulty from "@/components/home/networkCards/AverageBlockDifficulty.vue";
import AverageBlockTime from "@/components/home/networkCards/AverageBlockTime.vue";
import DailyTransactions from "@/components/home/networkCards/DailyTransactions.vue";
import ActivePlayerAddresses from "@/components/home/networkCards/ActivePlayerAddresses.vue";
import TotalNCGCreated from "@/components/home/networkCards/TotalNCGCreated.vue";
import TotalBlocks from "@/components/home/networkCards/TotalBlocks.vue";
import TotalTransactions from "@/components/home/networkCards/TotalTransactions.vue";
import TotalPlayerAddresses from "@/components/home/networkCards/TotalPlayerAddresses.vue";

export default {
  name: "Home",
  components: {
    NewsArticle,
    PvPLeaderboard,
    XPLeaderboard,
    AverageBlockDifficulty,
    AverageBlockTime,
    DailyTransactions,
    ActivePlayerAddresses,
    TotalNCGCreated,
    TotalBlocks,
    TotalTransactions,
    TotalPlayerAddresses,
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
  gap: 20px;
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
}

.leaderboards {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: stretch;
  gap: 20px;
  padding: 0;
}

.network-cards {
  align-self: stretch;
  flex-grow: 0;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: stretch;
  gap: 20px;
  // padding: 20px;
  // border-radius: 9px;
  // background-color: $dark-button-component;
}

.row-frame {
  // height: 94px;
  align-self: stretch;
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: stretch;
  gap: 20px;
  padding: 0;
}
</style>
