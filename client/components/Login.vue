<template>
  <div>
  <form @submit.prevent="checkData">
    <input
      type="text"
      name="email"
      v-model="login.email"
      placeholder="Entrez votre adresse-mail"
    />
    <input
      type="text"
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
</style>
