<template>
  <div id="panier">

    <article v-for="article in panier.articles" :key="article.idpanieritem" >
      <div class="article-img">
        <div :style="{ backgroundImage: 'url(' + article.image + ')' }">
        </div>
      </div>
      <div class="article-content">
        <div class="article-title">
          <h2>{{ article.name }} - {{ article.author }} - {{article.quantite}}</h2>

        </div>
        <p> {{ article.description }} </p>
      </div>
      <button  @click="deleteItem(article.idpanieritem)">Supprimer</button>
    </article>
    <button id="valider" @click="validate"> Valider le panier </button>
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
  methods : {
    async validate() {
      try {
        await axios.get('api/verif')
      }
      catch (err) {
        console.log(err)
      }
    },
    deleteItem(itemId) {
      this.$emit("delete-item",itemId)
    }
  }
}
</script>

<style scoped>
#panier {
  background-color:rgb(207, 207, 207) ;
  padding:2em;
}
article {
  display: flex;
  margin: 1em;
  background-color: white;
  border: solid rgb(207, 207, 207);
  border-radius: 25px;
}
button {
  width: 10%;
  height: 4em;
  margin: 1em;
  border-radius: 25px;
  padding : 1em
}
#valider {
  width: 20%;
  height: 4em;
  margin: 1em;
  border-radius: 25px;
  padding : 1em
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

</style>