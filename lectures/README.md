# Lectures

This folder collects all the lecture notebooks. A notebook is a file format, that can be *executed* by the Python package ``jupyter``. In case you install all necessary software on your laptop, you will be able to directly note into the lecture slides, add images, run your own code and find all the additional notes and code samples I putted into the files, but didn't show in lecture. An installation description is given at the end of this document.

Instead of installing all that stuff, you are also free to download only the notebooks ending on ``.html``. These are static versions of the real notebooks that can also be viewed in the browser, but cannot be changed. Therefore, you don't need to install anything.

## Binder

Instead of installing everything on your computer, there is also the binder tool. 
This is a free-to-use online jupyter notebook server with all the lectures available. 

*link will follow*

## Installing jupyter

**This step is not mandatory. Only if you want to run the notebooks on your own computer!**

There are a few things you'll have to do to run the notebooks on your own computer. You need Python. I tried to simplify the installation process as much as possible.

1. Download and install [Anaconda](https://www.anaconda.com/distribution/#download-section).

This is a package manager for Python and R. It is available for Windows, Linux and Mac. Anaconda can manage various parallel Python or R distributions. I have included a so-called *environment file* into the repo. That will install anything needed, without changing already existing Python installations.

2. Open the cloned or downloaded lecute material (https://github.com/KIT-HYD/geostatistics_lecture)

3. In that folder run your command line tool. For Windows, a program called *Anaconda Prompt* should have been added to your System. Open it and navigate to the material.

4. Now run:
```bash
conda update -f environment.yml -n base
```
This will take a moment.

5. From the anaconda prompt, or on Windows the Anaconda Navigator, you can change to the `lectures` folder and start the jupyter notebook server like:

```bash
jupyter notebook
```

Now, your browser should open with all the notebooks there. If it doesn't open, visit `http://localhost:8888/tree`.

