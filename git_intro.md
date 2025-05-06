以下是一份针对初学者的 Git 和 GitHub 入门指南，包含核心概念和常用操作示例：

---

# Git & GitHub 入门指南

## 一、什么是 Git 和 GitHub？
- **Git**：分布式版本控制系统，用于追踪代码变更历史
- **GitHub**：基于 Git 的代码托管平台，提供远程仓库和协作功能

## 二、环境准备
1. 安装 Git
   - 官网下载：https://git-scm.com/
2. 配置身份信息（只需一次）
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your@email.com"
   ```

## 三、基本操作流程

### 1. 创建本地仓库
```bash
mkdir my-project     # 创建项目文件夹
cd my-project        # 进入目录
git init             # 初始化仓库（生成.git隐藏文件夹）
```

### 2. 文件操作
```bash
echo "# My Project" > README.md  # 创建文件
git status                       # 查看状态（红色表示未跟踪文件）
git add README.md                # 添加文件到暂存区
git commit -m "Add README"       # 提交到本地仓库（必须写提交说明）
```

### 3. 查看历史记录
```bash
git log --oneline   # 简洁版提交历史
git log --graph     # 图形化显示分支结构
```

### 4. 分支管理
```bash
git branch feature    # 创建新分支
git checkout feature  # 切换分支
git checkout -b dev   # 创建并切换分支（推荐写法）

git merge dev         # 合并dev分支到当前分支
```

## 四、连接 GitHub

### 1. 创建远程仓库
1. 登录 GitHub → New repository
2. 不要勾选 Initialize with README（避免冲突）
3. 复制生成的仓库URL（如：`https://github.com/username/repo.git`）

### 2. 关联本地与远程
```bash
git remote add origin https://github.com/username/repo.git  # 绑定远程仓库
git branch -M main                                      # 重命名主分支为main
git push -u origin main                                 # 首次推送（-u设置上游）
```

### 3. 后续同步
```bash
git pull origin main    # 拉取远程更新
git push                # 推送本地更改（需先commit）
```

## 五、协作开发示例

### 场景：添加新功能
```bash
git checkout main              # 切换到主分支
git pull origin main           # 更新最新代码
git checkout -b new-feature    # 创建并切换新分支

# 进行代码修改后...
git add .
git commit -m "Implement new feature"
git push origin new-feature    # 推送新分支到GitHub

# 在GitHub创建Pull Request（PR）→ 等待审核合并
```

## 六、常见操作速查表

| 操作                 | 命令                      |
|----------------------|---------------------------|
| 查看文件状态         | `git status`              |
| 添加所有修改         | `git add .`               |
| 提交到本地仓库       | `git commit -m "说明"`    |
| 推送到远程仓库       | `git push`                |
| 拉取远程更新         | `git pull`                |
| 查看提交历史         | `git log --oneline`       |
| 创建新分支           | `git checkout -b 分支名`  |
| 切换分支             | `git checkout 分支名`     |

## 七、进阶技巧
1. **撤销修改**：
   ```bash
   git checkout -- file.txt    # 撤销未提交的文件修改
   git reset HEAD file.txt     # 从暂存区移除文件
   ```
   
2. **查看差异**：
   ```bash
   git diff                    # 工作区与暂存区的差异
   git diff --staged           # 暂存区与最新提交的差异
   ```

3. **标签管理**：
   ```bash
   git tag v1.0.0              # 创建轻量标签
   git push origin --tags      # 推送所有标签
   ```

---

通过本教程，您已经掌握了 Git 的核心工作流程和 GitHub 的基本协作方式。建议在实际项目中多练习提交、分支管理等操作，逐步熟悉更复杂的场景（如rebase、stash等）。遇到问题时可使用 `git --help` 查看命令手册。
