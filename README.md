# SYBaseTool

`SYBaseTool` 是最近工作中开始提取的一些常用的开发工具，包括一些常用的方法，和基础控件的封装。会慢慢完善


demo1 快速加载一个列表

```objective_c
override func viewDidLoad() {
    super.viewDidLoad()
    let tableview = UITableView.init().with {
        $0.ssy.addHelp { (help) in
            help.cellID = "SYDemo1TableViewCell"
        }
    }
    tableview.help.dataSource = dataSource()
    self.view.addSubview(tableview)
    tableview.ssy_snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
    }
}
    
func dataSource() -> [BaseCellLayoutModel] {
    var models:[BaseCellLayoutModel] = []
    return models
}
```