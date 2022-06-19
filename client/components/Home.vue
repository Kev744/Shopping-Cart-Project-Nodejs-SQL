<template>

  <div id="catalogue">
    <div id="recherche">Rechercher : <input type="text" id="search" placeholder="Quel livre souhaitez-vous ?" v-model="search" @change="findBook"></div>
    <div v-if="searchSucceed">
      <div class="article">
        <div class="article-img">
          <div :style="{ backgroundImage: 'url(' + searchArticle.image + ')' }">
          </div>
        </div>
        <div class="article-content">
          <div class="article-title">
            <h2>{{ searchArticle.name }} - {{ searchArticle.author }} - {{ searchArticle.quantite }} article(s) restant(s)</h2>
          </div>
          <p> {{searchArticle.description}} </p>
        </div>
        <button v-if="!administration"  @click="addToCart(searchArticle.id)"> Ajouter au panier </button>
      </div>

    </div>
    <article v-for="article in articles" :key="article.id_article" v-if="!searchSucceed">
      <div class="article-img">
        <div :style="{ backgroundImage: 'url(' + article.image + ')' }">
        </div>
      </div>
      <div class="article-content" v-if="editingArticle.id !== article.id_article">
        <div class="article-title">
          <h2>{{ article.name }} - {{ article.author }} - {{ article.quantite }} article(s) restant(s)</h2>

          <div>
            <button v-if="!administration"  @click="addToCart(article.id_article)"> Ajouter au panier </button>
            <button v-if="administration " @click="deleteArticle(article.id_article)">Supprimer</button>
            <button v-if="administration" @click="editArticle(article)">Modifier</button>
          </div>
        </div>
        <p>{{ article.description }}</p>
      </div>
      <div class="article-content" v-else>
        <div class="article-title">
          <h2><input type="text" v-model="editingArticle.name"> - <input type="text" v-model="editingArticle.author"> - <input type="number" v-model="editingArticle.quantite"></h2>
          <div>
            <button @click="sendEditArticle()">Valider</button>
            <button @click="abortEditArticle()">Annuler</button>
          </div>
        </div>
        <p><textarea v-model="editingArticle.description"></textarea></p>
        <input type="text" v-model="editingArticle.image" placeholder="Lien vers l'image">

      </div>


    </article>
    <add-article v-if="administration" @add-article="addArticle"/>

  </div>


</template>

<script>

module.exports = {
  props: {
    articles: { type: Array, default() {return [] }},
    panier: { type: Object },
    administration : { type: Boolean }
  },
  components: {"AddArticle" : window.httpVueLoader('./components/AddArticle.vue')},

  data () {
    return {
      search: '',
      searchSucceed : false,
      searchArticle: {
        id : 0,
        name: '',
        description: '',
        image: '',
        price: 0,
        quantite: 0,
      },
      editingArticle: {
        id: '',
        name: '',
        description: '',
        image: '',
        author: 0,
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
      this.editingArticle.author = article.author
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
    async findBook () {
      try {
        let data = this.articles.filter(d => d.name.toUpperCase().includes(this.search.trim().toUpperCase()))
        let id = data[0]["id_article"];
        let search = await axios.get('/api/article/' + id);
        this.searchArticle.name = search["data"][0]["name"];
        this.searchArticle.description = search["data"][0]["description"];
        this.searchArticle.image = search["data"][0]["image"];
        this.searchArticle.author = search["data"][0]["author"];
        this.searchArticle.quantite = search["data"][0]["quantite"];
        this.searchSucceed = true;
        this.searchArticle.id = search["data"][0]["id_article"];
        {if(this.search === "") {this.searchSucceed = false;}
        }
      }
      catch (error) {
        this.searchSucceed = false;
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
#catalogue {
  width:100%;
}
#recherche{
  margin:1em;
  padding: 1em;;
  font-size: large;
  background-color: rgb(207, 207, 207);
  border-radius: 25px;
}
input {
  width: 50%;
  height: 2em;
  margin: 1em;
  border-radius: 25px;
  padding : 0.5em
}
article {
  display: flex;
  margin: 1em;
  border: solid rgb(207, 207, 207);
  border-radius: 25px;
}
.article {
  display: flex;
  margin: 1em;
  border: solid rgb(207, 207, 207);
  border-radius: 25px;
}
button{
  margin: 1em;
}

.article-img div {
  margin: 1em;
  width:10em;
  height:10em;
  background-size: cover;
  border: 0.5px solid black;
}

.article-content {
  flex: 3;
}

.article-title {
  display: flex;
  justify-content: space-between;
}

textarea {
  width: 80%;
}
button {
  height: 4em;
  margin: 1em;
  border-radius: 25px;
  padding : 1em
}
</style>


