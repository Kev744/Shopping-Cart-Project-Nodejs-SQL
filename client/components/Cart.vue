<template>
  <div>
    <p> {{ this.panier.createdAt }}</p>
    <article v-for="article in panier.articles"  >
      <div class="article-img">
        <div :style="{ backgroundImage: 'url(' + article.image + ')' }">
        </div>
      </div>
      <div class="article-content">
        <div class="article-title">
          <h2>{{ article.name }} - {{ article.price }}€ </h2>
          <p> {{ article.description }} - {{article.quantite}}</p>
        </div>
      </div>
    </article>
  </div></template>

<script>
module.exports = {
  props: {
    articles: { type: Array, default: [] },
    panier: { type: Object},
    administration : { type: Boolean}
  },
  data () {
    return {
    }
  },
}
</script>

<style scoped>
article {
  display: flex;
}

.article-img {
  flex: 1;
}

.article-img div {
  width: 100px;
  height: 100px;
  background-size: cover;
}

.article-content {
  flex: 3;
}

.article-title {
  display: flex;
  justify-content: space-between;
}

textarea {
  width: 100%;
}
</style>