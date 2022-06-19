<template>
  <div id="demo">
    <form @submit="signup" action="#/login">
      <h2>Entrez vos coordonées</h2>
      <input type="email" v-model="register.email" placeholder="Insérez votre adresse-mail pour créer votre compte"/>
      <input type="password" v-model="register.password" placeholder="Entrez votre mot de passe">
      <input type="text" v-model="register.nom" placeholder="Inscrivez votre nom">
      <input type="text" v-model="register.prenom" placeholder="Inscrivez votre prénom">
      <div id="admine"> <label for="admin">Droits administrateurs</label>
        <input type="checkbox" id="admin" v-model="checked" @change="noEntry"></div>

      <button type="submit"> Envoyer </button>
    </form>
  </div>
</template>

<script>
module.exports = {
  name: "Signup",
  data() {
    return {
      register : {
        email : '',
        password : '',
        nom: '',
        prenom: '',
        admin : false,
      },
      checked: false,
    }
  },
  methods: {
    noEntry() {
      let password;
      password = !this.checked ?
          "" :
          prompt("Seul le personnel de la librairie y a accès, veuillez inscrire le mot de passe", "");
      password === "administrations" ? this.checked = true : this.checked = false
      document.getElementById("admin").checked = false
      this.register.admin = this.checked;
      document.getElementById("admin").checked = false;

    },
    async signup() {
      await axios.post('api/signup', this.register)
      alert("Bienvenue " + this.register.nom + " " + this.register.prenom)
    }
  }
}
</script>

<style scoped>
form {
  position: relative;
  display: flex;
  flex-flow: column nowrap;
  margin: 5em auto;
  width: 80%;
  padding: 2em;
  background-color: #247cc4;
  border-radius: 25px;
}
input {
  position: relative;
  width: 50%;
  height: 2em;
  margin: 1em;
  border-radius: 25px;
  padding : 0.5em
}
button {
  position: relative;
  width: 20%;
  height: 4em;
  margin: 1em;
  border-radius: 25px;
  padding : 1em
}
#admine{
  display: inline-block;
}
</style>