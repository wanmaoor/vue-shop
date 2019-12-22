<template>
  <div id="app">
    <Navigator
      :favNum="favNum"
      :purchaseNum="purchaseNum"
      @reset="handleReset"
      @search="handleSearch"
      :count="count"
      :img="img"
      :id="id"
    />
    <div class="showcases">
      <ShowCase
        :key="x.id"
        :src="x.source"
        :id="x.id"
        @addFav="addFav"
        @cancelFav="cancelFav"
        @purchased="handlePurchased"
        v-for="x in displayItems"
      />
    </div>
  </div>
</template>

<script>
	import {hashIndex} from "./hashIndex"
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
					{id: 1, type: "phone", name: "iphone8", source: iphone8},
					{id: 2, type: "phone", name: "iphone11", source: iphone11},
					{id: 3, type: "phone", name: "mate30pro", source: mate30pro},
					{id: 4, type: "phone", name: "iphone11pro", source: iphone11pro},
					{id: 5, type: "phone", name: "oneplus7pro", source: oneplus7pro},
					{id: 6, type: "book", name: "kamen", source: kamen},
					{id: 7, type: "book", name: "kelusu", source: kelusu},
					{id: 8, type: "book", name: "wangxiaobo", source: wangxiaobo},
				],
				favNum: 0,
				purchaseNum: 0,
				displayItems: [],
        count: 0,
        img: '',
        id: 0
			}
		},
		mounted() {
			this.displayItems = this.images
		},
		methods: {
			addFav() {
				this.favNum += 1
			},
			cancelFav() {
				this.favNum -= 1
			},
			handleReset() {
				this.displayItems = this.images
			},
			handlePurchased(val) {
				this.purchaseNum += 1
        const {count, img, id} = val
        this.count = count
        this.img = img
        this.id = id
			},
			handleSearch(val) {
				const itemName = val.toLowerCase()
				if (!val) {
					console.log("啥也沒傳")
					return
				} else {
					this.displayItems = []
					const images = this.images
					for (const item in hashIndex) {
						hashIndex[item].forEach(name => {
							if (name.includes(itemName)) {
								images.forEach(image => {
									if (image.name === item) {
										this.displayItems.push(image)
									}
								})
							}
						})
					}
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
    width 70vw
    margin 0 auto
    display grid
    grid-template-columns repeat(4, 25%)
    grid-gap 50px 50px
    justify-content: center;
    img
      max-width imgWidth
</style>
