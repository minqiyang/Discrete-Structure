Python 3.3 引入了 venv 模块，它是 Python 标准库的一部分，用于创建和管理虚拟环境。virtualenv 是一个第三方库，也用于创建虚拟环境，但它在 venv 出现之前就已经存在。

The venv module supports creating lightweight “virtual environments”, each with their own independent set of Python packages installed in their site directories. 
A virtual environment is created on top of an existing Python installation, known as the virtual environment’s “base” Python, and may optionally be isolated from 
the packages in the base environment, so only those explicitly installed in the virtual environment are available.

When used from within a virtual environment, common installation tools such as pip will install Python packages into a virtual environment without needing to be told to do so explicitly.

## Creating and activating virtual environments
```
### Create an virtual environment.  venv related scripts are located in 
c:\>python -m venv <venv directory>.               ### e.g. c:\myenv1

### Activate venv
C:\> <venv directory>\Scripts\activate.bat   ### e.g. c:\>myenv1\Scripts\activate.bat

### exit virtual env:
deactivate
```
After venv activated,you can install python packages in this venv by pip.
