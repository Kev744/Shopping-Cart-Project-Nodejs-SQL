<template>
  <form @submit.prevent="addArticle">
    <h2>Ajouter un livre au catalogue</h2>

    <input type="text" v-model="newArticle.name" placeholder="Titre du livre à insérer" required/>
    <input type="text" v-model="newArticle.author" placeholder="Auteur du livre" required>
    <p>Résumé :</p>
    <textarea  v-model="newArticle.description" required> </textarea>
    <input type="text" v-model="newArticle.image" placeholder="Lien vers l'image">
    <p>Quantité :</p>
    <input type="number" v-model="newArticle.quantite" placeholder="Quantité" required>
    <br>
    <button type="submit">Ajouter</button>
  </form>
</template>

<script>
module.exports = {
  props: {
    articles: { type: Array, default() {return [] }},
    panier: { type: Object }
  },
  data () {
    return {
      newArticle: {
        name: '',
        description: '',
        image: '',
        author: '',
        quantite: 0
      },

    }
  },
  methods: {
    addArticle() {
      this.$emit("add-article",this.newArticle)
    }
  },
  async mounted () {
  },}

</script>

<style scoped>
form {
  background-color: rgb(207, 207, 207);
  margin : 1em;
  padding: 1em;
  border-radius: 25px;
}

input {
  width: 30%;
  height: 2em;
  margin-top: 1em;
  margin-bottom: 1em;
  border-radius: 25px;

}

button {
  width: 20%;
  height: 4em;
  margin: 1em;
  border-radius: 25px;
  padding : 1em
}
</style>