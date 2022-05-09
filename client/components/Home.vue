<template>

  <div>
    <article v-for="article in articles" :key="article.id_article">
      <div class="article-img">
        <div :style="{ backgroundImage: 'url(' + article.image + ')' }">
        </div>
      </div>
      <div class="article-content" v-if="editingArticle.id !== article.id_article">
        <div class="article-title">
          <h2>{{ article.name }} - {{ article.price }}€ - {{ article.quantite }}</h2>

          <div>
          <button @click="addToCart(article.id_article)"> Ajouter au panier </button>
          <button @click="deleteArticle(article.id_article)">Supprimer</button>
          <button @click="editArticle(article)">Modifier</button>
          </div>
        </div>
        <p>{{ article.description }}</p>

      </div>
      <div class="article-content" v-else>
        <div class="article-title">
          <h2><input type="text" v-model="editingArticle.name"> - <input type="number" v-model="editingArticle.price"> - <input type="number" v-model="editingArticle.quantite"></h2>
          <div>
            <button @click="sendEditArticle()">Valider</button>
            <button @click="abortEditArticle()">Annuler</button>
          </div>
        </div>
        <p><textarea v-model="editingArticle.description"></textarea></p>
        <input type="text" v-model="editingArticle.image" placeholder="Lien vers l'image">
      </div>
    </article>
  <add-article @add-article="addArticle"/>
  </div>


</template>

<script>

module.exports = {
  props: {
    articles: { type: Array, default() {return [] }},
    panier: { type: Object }
  },
  components: {"AddArticle" : window.httpVueLoader('./components/AddArticle.vue')},

  data () {
    return {
      editingArticle: {
        id: '',
        name: '',
        description: '',
        image: '',
        price: 0,
        quantite: 0
      }
    }
  },
  methods: {
    addToCart (articleId) {
      this.$emit("add-cart",articleId)
    },

    addArticle (article) {
      this.$emit("add-article",article)
    },
    deleteArticle (articleId) {
      this.$emit('delete-article', articleId)
    },
    editArticle (article) {
      this.editingArticle.id = article.id_article
      this.editingArticle.name = article.name
      this.editingArticle.description = article.description
      this.editingArticle.image = article.image
      this.editingArticle.price = article.price
      this.editingArticle.quantite = article.quantite

    },
    sendEditArticle () {
      this.$emit('update-article', this.editingArticle)
      this.abortEditArticle()
    },
    abortEditArticle () {
      this.editingArticle = {
        id: -1,
        name: '',
        description: '',
        image: '',
        price: 0,
        quantite : 0
      }
    },
  }
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
