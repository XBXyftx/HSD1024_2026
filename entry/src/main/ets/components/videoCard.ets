/**
 * 视频卡片组件
 * 结构：封面（叠加播放量、弹幕量、时长）+ 标题 + 底部（已关注、作者、更多）
 * 用法：VideoCard({ img: $rawfile('fengMian.png'), viewCounts: '513.3万', ... })
 */
@ComponentV2
export struct VideoCard {
    /** 封面图 */
    @Require @Param img: Resource;
    /** 播放量文案，如 '513.3万' */
    @Require @Param viewCounts: string;
    /** 弹幕量文案，如 '1.1万' */
    @Require @Param commentsCounts: string;
    /** 视频时长文案，如 '11:33' */
    @Require @Param duration: string;
    /** 视频标题 */
    @Require @Param title: string;
    /** 作者昵称 */
    @Require @Param author: string;

    build() {
        Column() {
            // ---------- 封面区域 ----------
            Stack({ alignContent: Alignment.Bottom }) {
                Image(this.img)
                    .width('100%')
                    .borderRadius({ topLeft: 8, topRight: 8 })

                // 封面底部信息条：播放量 / 弹幕量 / 时长
                Row() {
                    Image($rawfile('boFangLiang.svg'))
                        .width(25)
                        .fillColor(Color.White)
                        .margin({ right: 5 })
                    Text(this.viewCounts)
                        .fontWeight(700)
                        .fontColor(Color.White)
                        .margin({ right: 15 })

                    Image($rawfile('danMuLiang.svg'))
                        .width(25)
                        .margin({ right: 5 })
                    Text(this.commentsCounts)
                        .fontWeight(700)
                        .fontColor(Color.White)

                    Blank() // 填充空余空间，把时长推到最右侧
                    Text(this.duration)
                        .fontWeight(700)
                        .fontColor(Color.White)
                }
                .width('100%')
                // 左右各留 10，与固定 300 宽度卡片的原布局保持一致
                .padding({ left: 10, right: 10, top: 5, bottom: 5 })
            }
            .width('100%')

            // ---------- 文本区域 ----------
            Column({ space: 15 }) {
                Text(this.title)
                    .width('100%')
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .fontColor(Color.White)
                    .fontSize(20)
                    .lineHeight(28)

                // 底部：已关注 / 作者 / 更多
                Row({ space: 8 }) {
                    Image($rawfile('duiGou.svg'))
                        .width(16)
                    Text('已关注')
                        .fontSize(16)
                        .fontColor('#fff45906')
                    Text(this.author)
                        .fontSize(16)
                        .fontColor(Color.Gray)
                    Blank() // 填充空余空间，把更多按钮推到最右侧
                    Image($rawfile('gengDuo.svg'))
                        .width(16)
                }
                .width('100%')
            }
            .padding(15)
            .width('100%')
            .backgroundColor('#ff2f2f2f')
            .borderRadius({ bottomLeft: 8, bottomRight: 8 })
        }
        .width(300)
        .borderRadius(8)
        .shadow({
            radius: 30,
            color: Color.Black,
            offsetX: 40,
            offsetY: 40
        })
    }
}
