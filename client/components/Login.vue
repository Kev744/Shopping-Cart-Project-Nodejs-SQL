<template>
  <div>
    <form @submit.prevent="checkData">
      <h2>Entrez vos identifiants</h2>
      <input
          type="email"
          name="email"
          v-model="login.email"
          placeholder="Entrez votre adresse-mail"
      />
      <input
          type="password"
          name="password"
          v-model="login.password"
          placeholder="Entrez votre mot de passe"
      />
      <button type="submit">Connexion</button>
    </form>
    <h3 v-if="correct"> Vous n'avez pas de compte, veuillez vous inscrire <a href="#/signup"> ici </a> s'il vous plaît </h3>
  </div>
</template>

<script>
module.exports = {
  name: "Login",

  data() {
    return {
      correct: false,
      login: {
        email: "",
        password: "",
      },
    };
  },

  methods: {
    async checkData() {
      let user = { email: this.login.email, password: this.login.password };

      try {
        const response = await axios.post("/api/login", user);
        console.log(response.data.success);
        if (response.data.success === 1) {
          await this.$router.push({ name: "home" });
        }
        if (response.data.success === 0) {
          this.error = "Connexion Échouée";
          this.correct = true;
        }
      } catch (err) {
        this.correct = true;
        console.error("network error", err);
      }
    },

  },
};
</script>

<style scoped>


form {
  position: relative;
  display: flex;
  flex-flow: column nowrap;
  margin: 5em auto;
  width: 80% ;
  padding: 2em;
  background-color: #247cc4;
  border-radius: 25px;
}

input {

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
h3 {
  position: relative;
  margin: 5em;
}
</style>
