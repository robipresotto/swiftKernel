# Swift Kernel for AWS SageMaker

### Getting started
1. Open the SageMaker Studio: File > New Launcher
2. Select the SageMaker image (TensorFlow 2+ GPU) to launch the activity
3. Select Image Terminal
4. Run the command bellow to create the swift kernel env
```
git clone https://github.com/robipresotto/swiftKernel.git && \
cd swiftKernel && \
bash run.sh
```
5. The kernel isn't persisted when the SageMaker image hosting the kernel is shutdown. To re-create the kernel for a new session run the command bellow:
```
conda env create --file ~/swiftKernel.yml
```
