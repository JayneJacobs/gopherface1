package handlers

import (
	"log"
	"net/http"

	"github.com/JayneJacobs/gopherface/common/authenticate"

	"go.isomorphicgo.org/go/isokit"

	"github.com/JayneJacobs/gopherface/common"
	"github.com/JayneJacobs/gopherface/forms"
)

func MyProfileHandler(env *common.Env) http.HandlerFunc {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

		formParams := isokit.FormParams{ResponseWriter: w, Request: r}
		myProfileForm := forms.NewMyProfileForm(&formParams)
		gfSession, err := authenticate.SessionStore.Get(r, "gopherface-session")
		if err != nil {
			log.Print(err)
		}

		uuid := gfSession.Values["uuid"]
		u, err := env.DB.GetUserProfile(uuid.(string))
		if err != nil {
			log.Print(err)
		}
		u.Username = gfSession.Values["username"].(string)
		u.Form = myProfileForm
		u.PageTitle = "My Profile"

		env.TemplateSet.Render("myprofile_page", &isokit.RenderParams{Writer: w, Data: u})
	})
}
