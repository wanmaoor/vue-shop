<template>
  <div id="app">
    <Navigator
      :favNum="favNum"
      :purchaseNum="purchaseNum"
      @search="handleSearch"
    />
    <div class="showcases">
      <ShowCase
        :key="x.id"
        :src="x.name"
        @addFav="addFav"
        @cancelFav="cancelFav"
        @purchased="handlePurchased"
        v-for="x in images"
      />
    </div>
  </div>
</template>

<script>
	import Navigator from "./components/Navigator"
	import ShowCase from "./components/ShowCase"
	import iphone11 from "./assets/iphone11.jpg"
	import iphone8 from "./assets/iphone8.jpg"
	import iphone11pro from "./assets/iphone11pro.jpg"
	import mate30pro from "./assets/mate30pro.jpg"
	import oneplus7pro from "./assets/oneplus7pro.jpg"
	import kamen from "./assets/kamen.jpg"
	import kelusu from "./assets/kelusu.jpg"
	import wangxiaobo from "./assets/wangxiaobo.jpg"

	export default {
		name: "app",
		components: {Navigator, ShowCase},
		data() {
			return {
				images: [
					{id: 1, type: "phone", name: iphone8},
					{id: 2, type: "phone", name: iphone11},
					{id: 3, type: "phone", name: mate30pro},
					{id: 4, type: "phone", name: iphone11pro},
					{id: 5, type: "phone", name: oneplus7pro},
					{id: 6, type: "book", name: kamen},
					{id: 7, type: "book", name: kelusu},
					{id: 8, type: "book", name: wangxiaobo},
				],
				favNum: 0,
				purchaseNum: 0
			}
		},
		methods: {
			addFav() {
				this.favNum += 1
			},
			cancelFav() {
				this.favNum -= 1
			},
			handlePurchased() {
				this.purchaseNum += 1
			},
      handleSearch(val){
				if (!val){
					return
        } else {
					console.log(val)
        }
      }
		}
	}
</script>

<style lang="stylus">
  imgWidth = 250px
  body
    background #eee;
  .showcases
    width 60vw
    margin-left auto
    margin-right auto
    margin-top: 50px
    display grid
    grid-template-columns repeat(4, 25%)
    img
      max-width imgWidth
</style>
