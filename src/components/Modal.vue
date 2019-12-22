<template>
  <div id="modal">
    <div class="modal-frame">
      <div class="modal-head">
        <h3>选择商品</h3>
        <button class="cancel" @click="$emit('cancel')">X</button>
      </div>
      <div class="modal-content">
        <img :src="src" alt="" >
        <div class="platform">
          <div class="counter">
            <button @click="count-=1" :disabled="x">-</button>
            <span>数量: {{count}}</span>
            <button @click="count+=1">+</button>
          </div>
          <button @click="purchase" :disabled="x">下单</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
	export default {
		name: "Modal",
    props: ['src', 'id'],
    data(){
			return {
				count:0
      }
    },
    methods: {
			purchase(){
				this.$emit('purchased', this.info)
      }
    },
    computed: {
			x(){
				return this.count === 0
      },
      info(){
				return {
					count: this.count,
          img: this.src,
          id: this.id
        }
      }
    }
	}
</script>

<style scoped lang="stylus">
  #modal
    width 100vw
    height 100vh
    position fixed
    top 0
    right 0
    background rgba(255,255,255,0.8)
    z-index 1
  .modal-frame
    display flex
    flex-direction column
    justify-content space-around
    width 60vw
    height 40vh
    background #fff
    position absolute
    z-index 2
    top 50%
    left 50%
    transform translate(-50%, -50%)
    -webkit-box-shadow 10px 10px 37px 1px rgba(0,0,0,0.75)
    -moz-box-shadow 10px 10px 37px 1px rgba(0,0,0,0.75)
    box-shadow 10px 10px 37px 1px rgba(0,0,0,0.75)
    border-radius: 13px 14px 14px 14px;
    -moz-border-radius: 13px 14px 14px 14px;
    -webkit-border-radius: 13px 14px 14px 14px;
    border: 0px solid #000000;
  .modal-head
    border-bottom 1px solid
    padding-bottom 3px
    h3
      margin-left: 20px
  .modal-content
    display grid
    grid-template-columns 20% 80%
    img
      max-width 170px
  .platform
    display flex
    flex-direction column
    align-items: center;
    position absolute
    top 50%
    right 0
    transform translate(-50%)
    button
      border none
      width: 150px
      padding: 15px
      background deepskyblue
      color: whitesmoke
      font-size 16px
      border-radius 5px
    .counter
      button
        border none
        width: 100px
        padding 10px
        margin: 20px
        font-size 32px
        border-radius 5px
        background orange
      span
        font-size 1.2em
  .cancel
    width: 50px
    height: 50px
    background red;
    position absolute
    outline none
    top: 5px
    right: 5px
    border none
    border-radius 50%
    font-size 1.5em
    transition all .5s ease-in-out
    color #f9f7eb
    &:hover
      background indianred
</style>