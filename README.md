# ScrollViewNestSwift
UIScrollView 嵌套 丝滑滚动 实现 Swift
一、 允许 手势传递 满足内外scrollview 都能触发对应手势和代理方法 在 UIScrollView 中存在 拖拽时会中断的情况 这是因为手势中断引起的。所以在做UIScrollView嵌套时，需要做多手势支持操作

实现 快速滚动时 内外嵌套ScrollView 能够 无缝衔接 滚动操作

// 许可手势冲突 确保 内外scrollview 都能同时触发手势 和 scrollviewDeleate

extension GWScrollView: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {

        return true;
    }
}

二、实现滚动代理 做相应判断处理 定义一个类 实例 用户保存 内外 scrollView 的滚动状态，这里不可使用 scrollView.scrollEnabled，因为scrollView.scrollEnabled = false；时会阻止手势

https://blog.csdn.net/wang_gwei/article/details/141108580?spm=1001.2014.3001.5502