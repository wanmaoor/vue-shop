<template>
  <div id="nav">
    <img
      @click="$emit('reset')"
      alt=""
      src="../assets/logo.png"
      title="点击重置商品列表"
    >
    <SearchInput @search="passToUp"/>
    <div :data-cart="purchaseNum" @click="toggleList" id="cart">
      <p>购物车</p>
      <div class="shopList" v-if="seen">
        <List
          :count="list.count"
          :id="list.id"
          :img="list.img"
          :key="list.id"
          @cancelFromList="handleCancelList"
          v-for="list in lists"/>
      </div>
    </div>
    <button :data-number="favNum" id="fav">我的收藏</button>

  </div>
</template>

<script>
	import SearchInput from "./SearchInput"
	import List from "./List"

	export default {
		name: "Navigator",
		props: {
			favNum: {
				type: Number,
				required: true
			},
			purchaseNum: {
				type: Number,
				required: true
			},
			count: Number,
			img: String,
			id: Number,
		},
		components: {SearchInput, List},
		methods: {
			passToUp(val) {
				this.$emit("search", val)
			},
			toggleList() {
				this.seen = !this.seen
			},
			handleCancelList(val) {
				this.lists = this.lists.filter(list => list.id !== val)
				this.$emit("cancelList")
			}
		},
		data() {
			return {
				lists: [],
				seen: false
			}
		},
		watch: {
			id: {
				handler() {
					this.lists.push({count: this.count, img: this.img, id: this.id})
				},
				deep: true
			}
		}
	}
</script>

<style lang="stylus" scoped>
  Width = 70vw
  Center = 0 auto
  button
    border 1px solid
    border-radius 5%
    margin-left 10px
    cursor pointer
    outline clear-after chocolate
    padding 10px
  #cart
    background #0099CC
    position relative
    color ghostwhite
    text-align center
    border-radius 4px
    &::before
      content attr(data-cart)
      position absolute
      right 5px
      top 5px
      width 20px
      height 20px
      border-radius 50%
      background #FF0033
      color #fff
      display flex
      justify-content: center;
      align-items: center;
      text-align center
  #nav
    width Width
    height 10vh
    margin Center
    display grid
    grid-template-columns 20% 50% 15% 15%
    align-items center
  #fav
    background yellow
    position relative
    border-color yellow
    border-radius 4px
    padding 17px
    &::before
      content attr(data-number)
      position absolute
      right 5px
      top 5px
      width 20px
      height 20px
      border-radius 50%
      background #FF0033
      color #fff
      display flex
      justify-content: center;
      align-items: center;
  img
    max-width 50px
    transition .5s all ease-in-out
    transform-origin center
    &:hover
      max-width 60px
  .shopList
    position absolute
    border: 1px solid #000;
    left 50%
    transform translateX(-50%)
    color black
    width 10vw
</style>