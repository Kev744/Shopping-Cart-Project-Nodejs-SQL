const Home = window.httpVueLoader('./components/Home.vue')
const Cart = window.httpVueLoader('./components/Cart.vue')
const AddArticle = window.httpVueLoader('./components/AddArticle.vue')
const Login = window.httpVueLoader('./components/Login.vue')
const Logout = window.httpVueLoader('./components/Logout.vue')
const SignUp = window.httpVueLoader('./components/Signup.vue')


const routes = [
  { path: '/', name: 'home', component: Home },
  { path: '/cart', component: Cart},
  { path: '/article', component: AddArticle},
  { path: '/login', component: Login},
  { path: '/logout', component: Logout},
  { path: '/signup', component: SignUp}


]

const router = new VueRouter({
  routes
})

const app = new Vue({
  router,
  el: '#app',
  data: {
    articles: [],
    panier: {
      createdAt: null,
      updatedAt: null,
      articles: []
    },
    login: {
      id_user: null,
      email: null,
      password: null,
      actif: false,
    }
  },
  async mounted () {
    const res = await axios.get('/api/article')
    this.articles = res.data
    const res2 = await axios.get('/api/panier')
    this.panier.articles = res2.data
  },
  methods: {
    async addToCart (articleId) {
      const res = await axios.post('/api/panier/' + articleId)
      this.panier.articles.push(res.data.articles)
    },
    async addArticle (article) {
      const res = await axios.post('/api/article', article)
      this.articles.push(res.data)
    },
    async updateArticle (newArticle) {
      await axios.put('/api/article/' + newArticle.id, newArticle)
      const article = this.articles.find(a => a.id === newArticle.id)
      article.name = newArticle.name
      article.description = newArticle.description
      article.image = newArticle.image
      article.price = newArticle.price
      article.quantite = newArticle.quantite
    },
    async deleteArticle (articleId) {
      await axios.delete('/api/article/' + articleId)
      const index = this.articles.findIndex(a => a.id === articleId)
      this.articles.splice(index, 1)
    },
    async logout() {
      try {
        await axios.get('/api/logout')

      }
      catch(err) {console.error("network error",err)}
    }
  }
})
