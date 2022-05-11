<template>
  <div id="demo">
    <form @submit="signup" action="#/login">
      <input type="email" v-model="register.email" placeholder="Insérez votre adresse-mail pour créer votre compte"/>
      <input type="password" v-model="register.password" placeholder="Mettez y votre mot de passe">
      <label for="admin"> Droits administrateurs </label>
      <input type="checkbox" id="admin" v-model="checked" @change="noEntry">
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
      console.log(this.register.admin)

    },
    async signup() {
      await axios.post('api/signup', this.register)
    }
  }
}
</script>

<style scoped>

</style>