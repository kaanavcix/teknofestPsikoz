/* 
  Align al() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 200,
        width: Get.width,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return cardostek();
          },
          itemCount: 3,
          //  indicatorLayout: PageIndicatorLayout.SLIDE,

          layout: SwiperLayout.STACK,
          itemHeight: 250,
          allowImplicitScrolling: true,

          duration: 1500,
          itemWidth: Get.width * 0.8,
          curve: Curves.easeInBack,
          outer: true,

          // pagination: SwiperPagination(),
          control: const SwiperControl(size: 0),
        ),
      ),
    );
  } */




/*   controller.isClicked.value
                        ? SizedBox(
                            child: Obx(() => AnimatedOpacity(
                                opacity: controller.isSizedBox.value ? 0 : 1,
                                duration: DurationUtilty.normalDuration(),
                                child: Text(
                                    "Cevapladığınız için teşekkür ederiz"))),
                          )
                        : Expanded(
                            flex: controller.isClicked.value ? 0 : 4,
                            child: Obx(
                              () => AnimatedOpacity(
                                  opacity:
                                      controller.isClicked.value ? 0.0 : 1.0,
                                  duration: DurationUtilty.normalDuration(),
                                  child: FeelBar()),
                            )), */