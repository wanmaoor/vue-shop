<template>
  <div class="showcase">
    <img :src="src" alt="">
    <div class="buttons">
      <button @click="handleFav" class="button">{{favState === true ? "取消收藏" : "收藏"}}</button>
      <button @click="handlePurchase" class="button">添加到购物车</button>
    </div>
    <Modal
      :src="src"
      :id="id"
      @cancel="handlePurchase"
      @purchased="handlePurchased"
      v-if="showModal"
    />
  </div>
</template>

<script>
	import Modal from "../components/Modal"

	export default {
		name: "ShowCase",
		components: {Modal},
		props: ["src", "id"],
		data() {
			return {
				favState: false,
				showModal: false
			}
		},
		methods: {
			handleFav() {
				if (!this.favState) {
					this.$emit("addFav")
				} else {
					this.$emit("cancelFav")
				}
				this.favState = !this.favState
			},
			handlePurchase() {
				this.showModal = !this.showModal
			},
			handlePurchased(val) {
				this.$emit("purchased", val)
				this.handlePurchase()
			}
		}
	}
</script>

<style lang="stylus" scoped>
  .showcase
    display flex
    justify-content center
    flex-direction column
    align-items: center;
    transition all .5s ease-in-out
    background white
    border-radius: 10px 10px 10px 10px;
    border: 0px solid #000000;
    box-shadow: 0 11.3px 10.3px rgba(0, 0, 0, 0.07),
      0 90px 82px rgba(0, 0, 0, 0.14);
  .buttons
    margin-top: 2vh
    margin-bottom:2vh
  .button
    height 3vh
    width 5vw
</style>