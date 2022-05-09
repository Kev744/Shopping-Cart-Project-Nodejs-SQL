<template>
<form @submit="checkData">
  <input type="text" name="email" v-model="login.email" placeholder="Entrez votre adresse-mail"/>
  <input type="text" name="password" v-model="login.password" placeholder="Entrez votre mot de passe"/>
  <button type="submit"> Connexion </button>
</form>

</template>

<script>

module.exports = {
  name: "Login",

  data () {
    return {
      login : {
        email: "",
        password: "",
      },
    }
  },

  methods : {
     async checkData() {
       let user = {email : this.login.email, password : this.login.password}

      try {
        const response = await axios.post('/api/login', user)
        console.log(response.data.success)
        if(response.data.success === 1){
          await this.$router.push({name: 'home'})
        }
        if(response.data.success === 0){
          this.error = "Connexion Échouée"
        }

      }
      catch(err) {console.error("network error",err)}
    }
  }
}


</script>

<style scoped>
button {
  padding: 10px;
}
</style>