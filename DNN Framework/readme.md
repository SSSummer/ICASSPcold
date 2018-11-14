# DNN-for-ICASSP
EFFECT OF PATHOLOGICAL VOICE IN SPEAKER RECOGNITION FOR HOME ASSISTANT

## Environment

- Python 3.5
- Tensorflow 1.3.0
- keras 2.0.5
- ubuntu 16.04

### Instruction 
There are 3 files for our DNN experiment.

- DNN.ipynb                        to get DNN model
- DNNtranser.ipynb                 to get DNN-Cold model
- runMe.ipynb                      to see the result directly

We have already trained model. 
Just download the model and put it in the current directory. Then run 'runMe' file directly to get the result.
Download address: https://drive.google.com/open?id=1BmGEv4GI03gQ8ZnQXnkSbkqvqvZueKbf

if you want to see different result.Please changed the Path from the runMe.ipynb

.. code:: python

      model = load_model('./my_model_32*3_withoutdct_5_tl_03gy_0928cold')  # 
      
      model = load_model('./my_model_32*3_withoutdct_2')
      
      model = load_model('./my_model_32*3_withoutdct_5')
      
      model = load_model('./my_model_32*3_withoutdct_10')
