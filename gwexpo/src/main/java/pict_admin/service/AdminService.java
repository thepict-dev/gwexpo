/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package pict_admin.service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Class Name : EgovSampleService.java
 * @Description : EgovSampleService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public interface AdminService {

	AdminVO get_user_info(AdminVO adminVO) throws Exception;
	
	void insert_user(AdminVO adminVO) throws Exception;

	List<?> user_list(AdminVO adminVO) throws Exception;

	void user_reset(AdminVO adminVO) throws Exception;

	void insert_login_info(AdminVO adminVO) throws Exception;

	void insert_meta(AdminVO adminVO)throws Exception;

	void dafault_template(PictVO pictVO)throws Exception;

	AdminVO user_select_one(AdminVO adminVO) throws Exception;

	void update_user(AdminVO adminVO)throws Exception;

	void user_delete(AdminVO adminVO) throws Exception;

	AdminVO get_user_info_funding(AdminVO adminVO) throws Exception;
	
}
