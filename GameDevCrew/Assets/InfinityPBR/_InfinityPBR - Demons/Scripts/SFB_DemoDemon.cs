using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SFB_DemoDemon : MonoBehaviour {

	private Animator animator;
	public GameObject[] materials;
	public Slider fadeSlider;
	public Slider powerSlider;
	public GameObject[] swipeTrails;
	public GameObject spawnPos;
	public GameObject castPrefab;
	private GameObject castObj;

	// Use this for initialization
	void Start () {
		animator = GetComponent<Animator>();
	}
	
	public void Locomotion(float newValue){
		animator.SetFloat ("locomotion", newValue);
	}

	public void SetEmissiveFadeSpeed(){
		for (int i = 0; i < materials.Length; i++){
			Renderer renderer = materials[i].GetComponent<Renderer>();
			renderer.material.SetFloat("_FadeSpeed", fadeSlider.value);
		}
	}

	public void SetEmissivePower(){
		for (int i = 0; i < materials.Length; i++){
			Renderer renderer = materials[i].GetComponent<Renderer>();
			renderer.material.SetFloat("_EmissivePower", powerSlider.value);
		}
	}

	public void ToggleSwipe(int value){
		swipeTrails [value].SetActive (!swipeTrails [value].activeSelf);
	}

	public void CastStart(){
		castObj = Instantiate(castPrefab, spawnPos.transform.position, Quaternion.identity);
		castObj.transform.parent = spawnPos.transform;
	}

	public void ThrowCast(){
		castObj.transform.parent = null;
		castObj.transform.rotation = transform.rotation;
		castObj.GetComponent<SFB_MoveOverTime>().enabled = true;
	}
}
