<template>
  <div id="app">
    <Navigator :favNum="favNum" :purchaseNum="purchaseNum"/>
    <div class="showcases">
      <ShowCase
        :src="x"
        @addFav="addFav"
        @cancelFav="cancelFav"
        @purchased="handlePurchased"
        v-for="x in images"
        :key="x"
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
				images: [iphone8, iphone11, iphone11pro, mate30pro, oneplus7pro, kamen, kelusu, wangxiaobo],
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
      handlePurchased(){
				this.purchaseNum += 1
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
