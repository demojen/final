package main

import (
	"bytes"
	"context"
	"io/ioutil"
	"net/http"

	"github.com/hashicorp/terraform-plugin-sdk/v2/diag"
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func resourceCustomAPIInvoke() *schema.Resource {
	return &schema.Resource{
		CreateContext: resourceCustomAPIInvokeCreate,
		ReadContext:   resourceCustomAPIInvokeRead,
		DeleteContext: resourceCustomAPIInvokeDelete,
		Schema: map[string]*schema.Schema{
			"url": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The API Gateway endpoint URL.",
			},
			"method": {
				Type:        schema.TypeString,
				Required:    true,
				Description: "The HTTP method (e.g., GET, POST).",
			},
			"payload": {
				Type:        schema.TypeString,
				Optional:    true,
				Description: "The JSON payload for POST requests.",
			},
			"response": {
				Type:        schema.TypeString,
				Computed:    true,
				Description: "The response from the API.",
			},
		},
	}
}

func resourceCustomAPIInvokeCreate(ctx context.Context, d *schema.ResourceData, meta interface{}) diag.Diagnostics {
	var diags diag.Diagnostics

	url := d.Get("url").(string)
	method := d.Get("method").(string)
	payload := d.Get("payload").(string)

	var req *http.Request
	var err error
	if method == "POST" {
		req, err = http.NewRequest(method, url, bytes.NewBuffer([]byte(payload)))
		if err != nil {
			return diag.FromErr(err)
		}
		req.Header.Set("Content-Type", "application/json")
	} else {
		req, err = http.NewRequest(method, url, nil)
		if err != nil {
			return diag.FromErr(err)
		}
	}

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		return diag.FromErr(err)
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return diag.FromErr(err)
	}

	// Save the response for users
	d.Set("response", string(body))
	d.SetId("customapi-invoke-id")

	return diags
}

func resourceCustomAPIInvokeRead(ctx context.Context, d *schema.ResourceData, meta interface{}) diag.Diagnostics {
	// No additional read operations; return empty diags.
	return nil
}

func resourceCustomAPIInvokeDelete(ctx context.Context, d *schema.ResourceData, meta interface{}) diag.Diagnostics {
	// Nothing to delete, but we unset the ID.
	d.SetId("")
	return nil
}
